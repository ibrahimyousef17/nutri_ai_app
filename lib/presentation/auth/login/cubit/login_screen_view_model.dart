import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/cubit/login_states.dart';

import '../../../../domain/use_case/login_use_case.dart';

class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase ;
  LoginScreenViewModel({required this.loginUseCase}):super(LoginInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login()async{
    emit(LoginLoadingState(loadingMessage: 'Loading...'));
    var either = await loginUseCase.invoke(emailController.text, passwordController.text);
    return either.fold(
            (l) => emit(LoginErrorState(errorMessage: l.errorMessage)),
            (r) => emit(LoginSuccessState(userEntity: r))
    );
  }

  loginWithGoogle(){}
  loginWithFacebook(){}

}