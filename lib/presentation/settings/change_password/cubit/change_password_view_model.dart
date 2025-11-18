import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/change_password/cubit/chnage_password_states.dart';

class ChangePasswordViewModel extends Cubit<ChangePasswordStates> {
  ChangePasswordViewModel() : super(ChangePasswordInitialState());
  final formKey = GlobalKey<FormState>();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();
}
