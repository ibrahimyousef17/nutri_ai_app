import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/privacy_and_policy/cubit/privacy_states.dart';

class PrivacyAndPolicyViewModel extends Cubit<PrivacyAndPolicyStates> {
  PrivacyAndPolicyViewModel() : super(PrivacyInitialState());

  List<String> privacyList = [];

  void loadTerms() async {
    emit(PrivacyLoadingState());
    try {
      String content =
          await rootBundle.loadString('assets/files/privacy_and_policy.txt');
      privacyList = content.split('\n');
      emit(PrivacySuccessState(privacyList: privacyList));
    } catch (e) {
      emit(PrivacyErrorState(errorMsg: e.toString()));
    }
  }
}
