import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/data/data_base/firebase/firebase_utils.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';

import '../../../../domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  FirebaseUtils firebaseUtils ;
  AuthRemoteDataSourceImpl({required this.firebaseUtils});
  @override
  Future<Either<Failures, UserEntity>> login(String email, String password) async {
    return firebaseUtils.login(email, password);
  }

  @override
  Future<Either<Failures, UserEntity>> register(String email, String password, String userName) {
    return firebaseUtils.register(email, password, userName);
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithFacebook() {
    return firebaseUtils.signInWithFacebook();
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithGoogle() {
    return firebaseUtils.signInWithGoogle();
  }

  @override
  Future<Either<Failures, void>> forgetPassword(String email) {
    return firebaseUtils.forgetPassword(email);
  }
}