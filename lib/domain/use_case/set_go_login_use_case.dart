import 'package:nutri_ai_food_calorie/domain/repository/repository/onboarding_repository.dart';

class SetGoLoginUseCase {
  OnboardingRepository onboardingRepository;
  SetGoLoginUseCase({required this.onboardingRepository});
  Future<bool> invoke(){
    return onboardingRepository.setGoLogin();
  }
}