import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_case/register_use_case.dart';
import 'register_states.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase ;
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  register()async{
    emit(RegisterLoadingState(loadingMessage: 'Loading....'));
    var either = await registerUseCase.invoke(emailController.text, passwordController.text, nameController.text);
    return either.fold(
            (l) => emit(RegisterErrorState(errorMessage: l.errorMessage)),
            (r) => emit(RegisterSuccessState(userEntity: r))
    );
  }

}