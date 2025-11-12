import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/auth_repository.dart';

import '../../../domain/repository/data_source/auth_local_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource ;
  AuthLocalDataSource authLocalDataSource ;
  AuthRepositoryImpl({required this.authRemoteDataSource,required this.authLocalDataSource});
  @override
  Future<Either<Failures, UserEntity>> login(String email, String password)async {
    // TODO: implement login
    var either = await authRemoteDataSource.login(email, password);
    return either.fold(
            (l) => Left(l),
            (r){
              saveUserInShared(r);
              return Right(r);
            }
    );
  }

  @override
  Future<Either<Failures, UserEntity>> register(String email, String password, String userName)async {
    // TODO: implement register
    var either = await  authRemoteDataSource.register(email, password, userName);
    return either.fold(
            (l) => Left(l),
            (r){
              saveUserInShared(r);
              return Right(r);
            }
    );
  }

  @override
  Future<bool> clearUser() {
   return authLocalDataSource.clearUser();
  }

  @override
  Either<Failures, UserEntity> getUserFromShared() {
    // TODO: implement getUserFromShared
    return authLocalDataSource.getUserFromShared();
  }

  @override
  Future<bool> saveUserInShared(UserEntity userEntity) {
    // TODO: implement saveUserInShared
    return authLocalDataSource.saveUserInShared(userEntity);
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithFacebook() async {
    var either = await authRemoteDataSource.loginWithFacebook();
    return either.fold((l) => Left(l), (r) {
      saveUserInShared(r);
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithGoogle() async {
    var either = await authRemoteDataSource.loginWithGoogle();
    return either.fold((l) => Left(l), (r) {
      saveUserInShared(r);
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, void>> forgetPassword(String email) {
    return authRemoteDataSource.forgetPassword(email);
  }
}