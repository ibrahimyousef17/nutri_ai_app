abstract class HelpStates {}

class HelpInitialState extends HelpStates {}

class HelpLoadingState extends HelpStates {}

class HelpSuccessState extends HelpStates {
  List<String> helpList;

  HelpSuccessState({required this.helpList});
}

class HelpErrorState extends HelpStates {
  String errorMsg;

  HelpErrorState({required this.errorMsg});
}
