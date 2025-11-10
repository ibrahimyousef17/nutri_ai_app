import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/cubit/auth_states.dart';

class AuthViewModel extends Cubit<AuthStates>{
AuthViewModel():super(AuthInitialState());
UserEntity? currentUser ;
 static AuthViewModel getProvider(BuildContext context)=>BlocProvider.of(context);
void setUser(UserEntity userEntity){
  currentUser =userEntity ;
  emit(AuthExistUser());
}
void clearUser(){
  currentUser=null;
  emit(AuthClearUser());
}
}