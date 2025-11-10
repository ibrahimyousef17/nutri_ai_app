import 'package:nutri_ai_food_calorie/data/data_base/firebase/firebase_utils.dart';
import 'package:nutri_ai_food_calorie/data/data_base/shared_pref/shared_preference.dart';
import 'package:nutri_ai_food_calorie/data/repository/repository/auth_repository_impl.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/auth_local_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/onboarding_local_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/splash_local_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/auth_repository.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/onboarding_repository.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/splash_repository.dart';
import 'package:nutri_ai_food_calorie/domain/use_case/get_user_from_local_use_case.dart';
import 'package:nutri_ai_food_calorie/domain/use_case/go_login_or_boarding_use_case.dart';
import 'package:nutri_ai_food_calorie/domain/use_case/login_use_case.dart';
import 'package:nutri_ai_food_calorie/domain/use_case/register_use_case.dart';
import 'package:nutri_ai_food_calorie/domain/use_case/set_go_login_use_case.dart';

import '../data/repository/data_source/auth_local_data_source_impl.dart';
import '../data/repository/data_source/auth_remote_data_source_impl.dart';
import '../data/repository/data_source/onboarding_local_data_source_impl.dart';
import '../data/repository/data_source/splash_local_data_source.dart';
import '../data/repository/repository/onboarding_repository_impl.dart';
import '../data/repository/repository/splash_repository_impl.dart';

AuthRepository injectAuthRepository(){
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource(),authLocalDataSource: injectAuthLocalDataSource());
}
OnboardingRepository injectOnboardingRepository(){
  return OnboardingRepositoryImpl(onboardingLocalDataSource: injectOnboardingLocalDataSource());
}
SplashRepository injectSplashRepository(){
  return SplashRepositoryImpl(splashLocalDataSource: injectSplashLocalDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(firebaseUtils: FirebaseUtils.getInstance());
}
AuthLocalDataSource injectAuthLocalDataSource(){
  return AuthLocalDataSourceImpl(sharedPref: SharedPref.getInstance());
}
OnboardingLocalDataSource injectOnboardingLocalDataSource(){
  return OnboardingLocalDataSourceImpl(sharedPref: SharedPref.getInstance());
}
SplashLocalDataSource injectSplashLocalDataSource(){
  return SplashLocalDataSourceImpl(sharedPref: SharedPref.getInstance());
}

LoginUseCase injectLoginUseCase(){
  return LoginUseCase(authRepository: injectAuthRepository());
}

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(authRepository: injectAuthRepository());
}

SetGoLoginUseCase injectSetGoLoginUseCase(){
  return SetGoLoginUseCase(onboardingRepository: injectOnboardingRepository());
}

GoLoginOrOnboardingUseCase injectGoLoginOrOnboardingUseCase(){
  return GoLoginOrOnboardingUseCase(splashRepository: injectSplashRepository());
}
GetUserFromLocalUseCase injectGetUserFromLocalUseCase(){
  return GetUserFromLocalUseCase(authRepository: injectAuthRepository());
}