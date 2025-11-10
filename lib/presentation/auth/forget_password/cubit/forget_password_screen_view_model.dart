import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/forget_password/cubit/forget_password_states.dart';

class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordStates>{
  ForgetPasswordScreenViewModel():super(ForgetPasswordInitialState());

  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}