import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/presentation/onboarding_screen/cubit/onboarding_states.dart';

import '../../../domain/use_case/set_go_login_use_case.dart';

class OnboardingViewModel extends Cubit<OnboardingStates>{
  SetGoLoginUseCase setGoLoginUseCase ;
  OnboardingViewModel({required this.setGoLoginUseCase}):super(OnboardingInitialState());

  seGoLogin(){
    return setGoLoginUseCase.invoke();
  }
}