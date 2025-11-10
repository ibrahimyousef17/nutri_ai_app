import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';
import 'package:nutri_ai_food_calorie/presentation/splash_screen/cubit/splash_states.dart';

import '../../../domain/use_case/get_user_from_local_use_case.dart';
import '../../../domain/use_case/go_login_or_boarding_use_case.dart';

class SplashViewModel extends Cubit<SplashStates> {
  GoLoginOrOnboardingUseCase goLoginOrOnboardingUseCase ;
  GetUserFromLocalUseCase getUserFromLocalUseCase;
  SplashViewModel({required this.goLoginOrOnboardingUseCase,required this.getUserFromLocalUseCase}):super(SplashInitialState());

  bool? goLoginOrBoarding() {
    return goLoginOrOnboardingUseCase.invoke();
  }
  Either<Failures, UserEntity> getUserFromShared(){
    return getUserFromLocalUseCase.invoke();
  }
}