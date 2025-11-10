import 'package:nutri_ai_food_calorie/domain/repository/repository/splash_repository.dart';

class GoLoginOrOnboardingUseCase {
  SplashRepository splashRepository ;
  GoLoginOrOnboardingUseCase({required this.splashRepository});

  bool? invoke(){
    return splashRepository.goLoginOrBoarding();
  }
}