import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/data/data_base/shared_pref/shared_preference.dart';
import 'package:nutri_ai_food_calorie/data/model/user_dto.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource{
  SharedPref sharedPref ;
  AuthLocalDataSourceImpl({required this.sharedPref});
  @override
  Future<bool> clearUser() {
    return sharedPref.clearUser();
  }

  @override
  Either<Failures, UserEntity> getUserFromShared() {
   return sharedPref.getUserFromShared();
  }

  @override
  Future<bool> saveUserInShared(UserEntity userEntity) {
    var userDto = UserDto(id: userEntity.id, email: userEntity.email, userName: userEntity.userName);
    return sharedPref.saveUserInShared(userDto);
  }

}