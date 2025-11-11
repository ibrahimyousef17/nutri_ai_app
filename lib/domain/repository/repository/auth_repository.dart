import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';

abstract class AuthRepository{
  Future<Either<Failures,UserEntity>> login(String email ,String password);
  Future<Either<Failures,UserEntity>> register(String email ,String password,String userName);
  Future<bool> saveUserInShared(UserEntity userEntity);
  Either<Failures,UserEntity> getUserFromShared();
  Future<bool> clearUser();

  Future<Either<Failures, UserEntity>> loginWithGoogle();

  Future<Either<Failures, UserEntity>> loginWithFacebook();
}