abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates{
}

class ForgetPasswordLoadingState extends ForgetPasswordStates {
  String loadingMsg;

  ForgetPasswordLoadingState({required this.loadingMsg});
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  String errorMsg;

  ForgetPasswordErrorState({required this.errorMsg});
}

class ForgetPasswordSuccessState extends ForgetPasswordStates {}
