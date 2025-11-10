import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nutri_ai_food_calorie/domain/di.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/cubit/auth_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/login_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/home/home_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/splash_screen/cubit/splash_cubit.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';
var viewModel = SplashViewModel(goLoginOrOnboardingUseCase: injectGoLoginOrOnboardingUseCase(),getUserFromLocalUseCase: injectGetUserFromLocalUseCase());
  @override
  Widget build(BuildContext context) {
    final goLogin = viewModel.goLoginOrBoarding();
    Timer(Duration(seconds: 3), () {
      if(goLogin==true){
        var either = viewModel.getUserFromShared() ;
        either.fold(
                (l) => Navigator.of(context).pushNamed(LoginScreen.routeName)
            ,
                (r){
                  if(AuthViewModel.getProvider(context).currentUser==null){
                    AuthViewModel.getProvider(context).currentUser = r ;
                    //todo: go Home
                    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  }
                }
        );
      }else {
        Navigator.of(context).pushReplacementNamed(OnboardingScreen.routeName);
      }
    });
    return Image.asset(AppAssets.splashImage,fit: BoxFit.fill,width: double.infinity,height: double.infinity,);
  }
}
