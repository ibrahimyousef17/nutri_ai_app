abstract class PrivacyAndPolicyStates {}

class PrivacyInitialState extends PrivacyAndPolicyStates {}

class PrivacyLoadingState extends PrivacyAndPolicyStates {}

class PrivacySuccessState extends PrivacyAndPolicyStates {
  List<String> privacyList;

  PrivacySuccessState({required this.privacyList});
}

class PrivacyErrorState extends PrivacyAndPolicyStates {
  String errorMsg;

  PrivacyErrorState({required this.errorMsg});
}
