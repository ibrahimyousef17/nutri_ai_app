import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';

import '../../entity/failures.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveUserInShared(UserEntity userEntity);
  Either<Failures,UserEntity> getUserFromShared();
  Future<bool> clearUser();
}