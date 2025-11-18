import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/data/data_base/shared_pref/shared_preference.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/cubit/auth_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/forget_password/forget_password_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/login_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/reset_password/reset_password_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/verification/verification_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/home/home_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/home/notification/notification_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/change_password/change_password_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/favorite/favorite_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/help/help_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/more_settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/privacy_and_policy/privacy_and_policy_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/terms_and_condition/terms_and_condition_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/notifications_settings/notification_settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/payment_method_settings/payment_method_settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/profile/profile_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/splash_screen/splash_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_theme.dart';

import 'presentation/auth/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPref.getInstance().init();
  runApp(BlocProvider(
    create: (context) => AuthViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              OnboardingScreen.routeName: (context) => OnboardingScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              VerificationScreen.routeName: (context) => VerificationScreen(),
              NotificationScreen.routeName: (context) => NotificationScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  ForgetPasswordScreen(),
              ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              SettingsScreen.routeName: (context) => SettingsScreen(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
              ChangePasswordScreen.routeName: (context) =>
                  ChangePasswordScreen(),
              NotificationSettingsScreen.routeName: (context) =>
                  NotificationSettingsScreen(),
              PaymentMethodSettingsScreen.routeName: (context) =>
                  PaymentMethodSettingsScreen(),
              FavoriteScreen.routeName: (context) => FavoriteScreen(),
              MoreSettingsScreen.routeName: (context) => MoreSettingsScreen(),
              TermsAndConditionScreen.routeName: (context) =>
                  TermsAndConditionScreen(),
              PrivacyAndPolicyScreen.routeName: (context) =>
                  PrivacyAndPolicyScreen(),
              HelpScreen.routeName: (context) => HelpScreen(),
            },
          );
        });
  }
}

