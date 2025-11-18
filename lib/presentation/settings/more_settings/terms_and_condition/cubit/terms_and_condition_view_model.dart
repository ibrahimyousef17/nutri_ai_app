import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/terms_and_condition/cubit/terms_and_condition_states.dart';

class TermsAndConditionViewModel extends Cubit<TermsAndConditionStates> {
  TermsAndConditionViewModel() : super(TermsInitialState());

  List<String> termsList = [];

  void loadTerms() async {
    emit(TermsLoadingState());
    try {
      String content =
          await rootBundle.loadString('assets/files/terms_and_condition.txt');
      termsList = content.split('\n');
      emit(TermsSuccessState(termsList: termsList));
    } catch (e) {
      emit(TermsErrorState(errorMsg: e.toString()));
    }
  }
}
