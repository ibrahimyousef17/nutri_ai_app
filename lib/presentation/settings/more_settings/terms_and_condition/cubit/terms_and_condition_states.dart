abstract class TermsAndConditionStates {}

class TermsInitialState extends TermsAndConditionStates {}

class TermsLoadingState extends TermsAndConditionStates {}

class TermsSuccessState extends TermsAndConditionStates {
  List<String> termsList;

  TermsSuccessState({required this.termsList});
}

class TermsErrorState extends TermsAndConditionStates {
  String errorMsg;

  TermsErrorState({required this.errorMsg});
}
