import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/data/model/user_dto.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late SharedPreferences sharedPreferences ;
 static SharedPref? _sharedPref ;
 SharedPref._();
 static SharedPref getInstance(){
   _sharedPref ??= SharedPref._();
   return _sharedPref!;
 }

 Future<SharedPreferences> init() async {
   sharedPreferences = await SharedPreferences.getInstance();
   return sharedPreferences ;
 }
 
 Future<bool> setGoLogin(){
   return sharedPreferences.setBool('goLogin', true);
 }
 bool? goLoginOrBoarding(){
   var goLogin = sharedPreferences.getBool('goLogin');
   return goLogin ;
 }
  Future<bool> saveUserInShared(UserDto userDto){
   return sharedPreferences.setString('currentUser', jsonEncode(userDto.toJson()));
  }

  Either<Failures,UserDto> getUserFromShared(){
  var data =  sharedPreferences.getString('currentUser');
  if(data!=null){
    UserDto user = UserDto.fromJson(jsonDecode(data));
    return Right(user);
  }else{
    return Left(LocalError(errorMessage: 'please login again'));
  }
  }

  Future<bool> clearUser(){
   return sharedPreferences.remove('currentUser');
  }
}