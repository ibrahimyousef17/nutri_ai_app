import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/privacy_and_policy/cubit/privacy_states.dart';

import 'help_states.dart';

class HelpViewModel extends Cubit<HelpStates> {
  HelpViewModel() : super(HelpInitialState());

  List<String> helpList = [];

  void loadTerms() async {
    emit(HelpLoadingState());
    try {
      String content = await rootBundle.loadString('assets/files/help.txt');
      helpList = content.split('\n');
      emit(HelpSuccessState(helpList: helpList));
    } catch (e) {
      emit(HelpErrorState(errorMsg: e.toString()));
    }
  }
}
