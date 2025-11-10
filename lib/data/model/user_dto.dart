import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';

class UserDto extends UserEntity{
  static const String collectionName = 'users' ;
  UserDto({
    required super.id,
    required super.email,
    required super.userName,
});

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'email':email,
      'userName':userName,
    };
  }

   factory UserDto.fromJson(Map<String,dynamic>? json)=>UserDto(
       id: json?['id'] as String,
       email: json?['email'] as String,
       userName: json?['userName'] as String
   );
}