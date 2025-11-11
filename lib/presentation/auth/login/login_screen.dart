import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/domain/di.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/cubit/auth_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/cubit/login_screen_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/cubit/login_states.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/widget/item_button_auth.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/widget/item_text_form_field.dart';
import 'package:nutri_ai_food_calorie/presentation/home/home_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/dialog_utils.dart';

import '../forget_password/forget_password_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login screen';
  var viewModel = LoginScreenViewModel(
      loginUseCase: injectLoginUseCase(),
      loginWithGoogleUseCase: injectLoginWithGoogleUseCase(),
      loginWithFacebookUseCase: injectLoginWithFacebookUseCase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: BlocListener<LoginScreenViewModel, LoginStates>(
        bloc: viewModel,
  listener: (context, state) {
    if(state is LoginLoadingState){
      DialogUtils.showLoading(context);
    }else if(state is LoginErrorState){
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context: context, title: 'Error', message: state.errorMessage,posActionName: 'Ok');
    }else if(state is LoginSuccessState){
      DialogUtils.hideLoading(context);
      AuthViewModel.getProvider(context).setUser(state.userEntity);
      Future.delayed(Duration(seconds: 1));

      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } else if (state is UserCancelledErrorState) {
            Navigator.of(context).pop();
          }
        },
  child: Container(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100.h,),
              Text('Welcome Back to NutriAI',style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 10.h,),
              Text('Eat better. Get back on track.',style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 40.h,),
              Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    ItemTextFormField(
                        controller: viewModel.emailController,
                        hintText: 'enter your email',
                        validate: (email){
                          if(email==null|| email.isEmpty){
                            return 'please enter your email' ;
                          }
                          final bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);
                          if(!emailValid){
                            return 'please enter valid email' ;
                          }
                          return null ;
                        },
                        textName: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20,),
                    ItemTextFormField(
                        controller: viewModel.passwordController,
                      hintText: 'enter your password',
                        validate: (password){
                          if(password==null|| password.isEmpty){
                            return 'please enter your password';
                          }
                          if(password.length<6){
                            return 'the password must be at least six numbers' ;
                          }
                          return null ;
                        },
                        textName: 'Password',
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      //todo:navigate to  forgot password screen
                      Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName);
                    },
                    child: Text('Forgot Password',style: Theme.of(context).textTheme.titleMedium,)),
              ),
              SizedBox(height: 30.h,),
              Row(
                children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColor.darkGreyColor,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text('Or',style: Theme.of(context).textTheme.titleMedium,),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColor.darkGreyColor,
                  ),
                ),
              ],),
              SizedBox(height: 30.h,),
              ItemButtonAuth(buttonText: 'Continue with Google', iconPath: AppAssets.google_icon ,onPressed: (){
                //todo: continue with google
                    viewModel.loginWithGoogle();
                  },),
              SizedBox(height: 20.h,),
              ItemButtonAuth(buttonText: 'Continue with Facebook', iconPath: AppAssets.facebook_icon ,onPressed: (){
                //todo: continue with facebook
                    viewModel.loginWithFacebook();
                  },),
              SizedBox(height: 80.h,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(14.w),
                  backgroundColor: AppColor.orangeLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)
                  )
                ),
                  onPressed: (){
                  if(viewModel.formKey.currentState!.validate()){
                    //todo: log in
                    viewModel.login();
                  }
                  },
                  child:Text('Log In',style: Theme.of(context).textTheme.titleMedium,) ),
              SizedBox(height: 24.h,),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(text: "Don’t have an account?"),
                      TextSpan(text: "Sign Up",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColor.orangeLightColor,
                        fontWeight: FontWeight.w500
                      ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                        //todo: navigate to sign up
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                      ),
                    ]
                  )
                ),
              )
            ],
          ),
        ),
      ),
),
    );
  }
}
