import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/reset_password/cubit/reset_password_states.dart';

class ResetPasswordScreenViewModel extends Cubit<ResetPasswordStates>{
  ResetPasswordScreenViewModel():super(ResetPasswordInitialState());

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}