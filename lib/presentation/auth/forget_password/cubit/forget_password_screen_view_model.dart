import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/forget_password/cubit/forget_password_states.dart';

import '../../../../domain/use_case/forget_password_use_case.dart';

class ForgetPasswordScreenViewModel extends Cubit<ForgetPasswordStates>{
  ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordScreenViewModel({required this.forgetPasswordUseCase})
      : super(ForgetPasswordInitialState());

  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  forgetPassword() async {
    emit(ForgetPasswordLoadingState(loadingMsg: 'Loading...'));
    var either = await forgetPasswordUseCase.invoke(emailController.text);
    return either.fold(
        (l) => emit(ForgetPasswordErrorState(errorMsg: l.errorMessage)),
        (r) => emit(ForgetPasswordSuccessState()));
  }
}