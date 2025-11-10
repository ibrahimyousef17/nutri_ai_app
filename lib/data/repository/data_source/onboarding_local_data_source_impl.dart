import 'package:nutri_ai_food_calorie/data/data_base/shared_pref/shared_preference.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/onboarding_local_data_source.dart';

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource{
  SharedPref sharedPref;
  OnboardingLocalDataSourceImpl({required this.sharedPref});
  @override


  @override
  Future<bool> setGoLogin() {
    return sharedPref.setGoLogin();
  }

}