import 'package:nutri_ai_food_calorie/domain/repository/data_source/onboarding_local_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository{
  OnboardingLocalDataSource onboardingLocalDataSource;
  OnboardingRepositoryImpl({required this.onboardingLocalDataSource});
  @override

  @override
  Future<bool> setGoLogin() {
    // TODO: implement setGoLogin
    return onboardingLocalDataSource.setGoLogin();
  }

}