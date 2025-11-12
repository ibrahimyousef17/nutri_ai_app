import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nutri_ai_food_calorie/data/model/user_dto.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';

class FirebaseUtils{

  static FirebaseUtils? _firebaseUtils ;
  FirebaseUtils._();

 static  FirebaseUtils getInstance(){
    _firebaseUtils ??= FirebaseUtils._();
    return _firebaseUtils !;
  }

  Future<Either<Failures, UserDto>> login(String email , String password)async{
    var connectivityResult = await Connectivity().checkConnectivity() ;

    if(connectivityResult == ConnectivityResult.mobile || connectivityResult ==ConnectivityResult.wifi){
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );

        if(credential.user==null){
          Left(ServerError(errorMessage: 'something went wrong please login again'));
        }
        UserDto? userDto = await getUserFromFireStore(credential.user!.uid) ;
        if(userDto == null){
          Left(ServerError(errorMessage: 'something went wrong please login again'));
        }
        return Right(userDto!);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          return Left(ServerError(errorMessage: 'No user found for that email.'));
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          return Left(ServerError(errorMessage: 'Wrong password provided for that user.'));
        } else if (e.code=='invalid-credential'){
          print('invalid-credential');
          return Left(ServerError(
              errorMessage: 'email or password not invalid'));
        }
      }catch(e){
        return Left(ServerError(errorMessage: e.toString()));

      }
    }
    return Left(NetworkError(errorMessage: 'Please check your internet'));
  }

  Future<Either<Failures,UserDto>> register(String email , String password,String userName)async{
    var connectivityResult = await Connectivity().checkConnectivity() ;

    if(connectivityResult == ConnectivityResult.mobile || connectivityResult ==ConnectivityResult.wifi){
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        //success ready to store user
        if(credential.user==null){
          return Left(ServerError(errorMessage: 'Something went wrong please register again'));
        }
        var userDto = UserDto(id: credential.user!.uid, email: email, userName: userName);
        await storeUserToFireStore(userDto);
        return Right(userDto);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          return Left(ServerError (errorMessage: 'The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          return Left(ServerError(errorMessage: 'The account already exists for that email.'));
        }
      } catch (e) {
        print(e);
        return Left(ServerError(errorMessage: e.toString()));
      }
    }
      return Left(NetworkError(errorMessage: 'Please check your internet'));
  }

  Future<Either<Failures,UserDto>> signInWithGoogle()async{
    var connectivityResult = await Connectivity().checkConnectivity() ;

    if(connectivityResult == ConnectivityResult.mobile || connectivityResult ==ConnectivityResult.wifi){
      try{
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if(googleUser==null) return Left(UserCancelledError(errorMessage: 'user cancel'));
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        var userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
        if(userCredential.user==null){ return Left(ServerError(errorMessage: 'SomeThing went wrong please login again'));}
        var userDto = UserDto(id: userCredential.user!.uid, email: userCredential.user!.email ??'', userName: userCredential.user!.displayName??'');
        storeUserToFireStore(userDto);
        return Right(userDto);
      }catch(e){
        return Left(ServerError(errorMessage: e.toString()));
      }
    }else{
      return Left(NetworkError(errorMessage: 'Please check your internet'));
    }
  }

  Future<Either<Failures,UserDto>> signInWithFacebook()async{
    var connectivityResult = await Connectivity().checkConnectivity() ;

    if(connectivityResult == ConnectivityResult.mobile || connectivityResult ==ConnectivityResult.wifi){
      try{
        final LoginResult loginResult = await FacebookAuth.instance.login();
        if (loginResult.status != LoginStatus.success) {
          return Left(UserCancelledError(errorMessage: 'user cancel'));
        }
        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

        // Once signed in, return the UserCredential
        var userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
        if(userCredential.user==null){ return Left(ServerError(errorMessage: 'SomeThing went wrong please login again'));}
        var userDto = UserDto(id: userCredential.user!.uid, email: userCredential.user!.email ??'', userName: userCredential.user!.displayName??'');
        await storeUserToFireStore(userDto);
        return Right(userDto);
      }catch(e){
        return Left(ServerError(errorMessage: e.toString()));
      }
    }else{
      return Left(NetworkError(errorMessage: 'Please check your internet'));
    }
  }

  Future<Either<Failures, void>> forgetPassword(String email) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        return const Right(null);
      } catch (e) {
        return Left(ServerError(errorMessage: e.toString()));
      }
    } else {
      return Left(NetworkError(errorMessage: 'please check your internet'));
    }
  }

  CollectionReference<UserDto> userCollection(){
    return FirebaseFirestore.instance.collection(UserDto.collectionName).withConverter<UserDto>(
        fromFirestore: (snapshot,options)=>UserDto.fromJson(snapshot.data()),
        toFirestore: (userDto,_)=>userDto.toJson());
  }

  Future<void> storeUserToFireStore(UserDto userDto){
    return userCollection().doc(userDto.id).set(userDto);

  }

  Future<UserDto?> getUserFromFireStore(String userId) async {
    var userDocument = await  userCollection().doc(userId).get();
    return userDocument.data();
  }

}