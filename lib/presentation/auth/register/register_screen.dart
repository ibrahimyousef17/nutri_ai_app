import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/domain/di.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/login_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/register/cubit/register_screen_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/register/cubit/register_states.dart';
import 'package:nutri_ai_food_calorie/presentation/home/home_screen.dart';
import '../../utils/app_color.dart';
import '../../utils/dialog_utils.dart';
import '../cubit/auth_view_model.dart';
import '../widget/item_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register screen';
  var viewModel = RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.darkGreyColor,
              shape: CircleBorder(

              )
            ),
              onPressed: (){
            Navigator.of(context).pop();
          }, child: Icon(Icons.arrow_back_ios,size: 20.sp,color: AppColor.whiteColor,)),
        )
      ),
      backgroundColor: AppColor.primaryColor,
      body: BlocListener<RegisterScreenViewModel, RegisterStates>(
        bloc: viewModel,
  listener: (context, state) {
    // TODO: implement listener
    if(state is RegisterLoadingState){
      DialogUtils.showLoading(context);
    }else if(state is RegisterErrorState){
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context: context, title: 'Error', message: state.errorMessage,posActionName: 'Ok');
    }else if(state is RegisterSuccessState){
      DialogUtils.hideLoading(context);
      AuthViewModel.getProvider(context).setUser(state.userEntity);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  },
  child: Container(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100.h,),
              Text('Create Your NutriAI Account',style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 10.h,),
              Text('Eat better. Get back on track..',style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: 40.h,),
              Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    ItemTextFormField(
                      controller: viewModel.nameController,
                      hintText: 'enter your name',
                      validate: (name){
                        if(name==null|| name.isEmpty||name.length==1){
                          return 'please enter your password';
                        }
                        return null ;
                      },
                      textName: 'Name',
                    ),
                    SizedBox(height: 20,),
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
              SizedBox(height: 100.h,),
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
                      //todo: sign up
                      viewModel.register();
                    }
                  },
                  child:Text('Sign Up',style: Theme.of(context).textTheme.titleMedium,) ),
              SizedBox(height: 24.h,),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                    TextSpan(
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(text: "Already have an account?"),
                          TextSpan(text: "Log In",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColor.orangeLightColor,
                              fontWeight: FontWeight.w500
                          ),
                          recognizer: TapGestureRecognizer()..onTap =(){
                            //todo: navigate to login
                            Navigator.pushReplacementNamed(context,LoginScreen.routeName);
                          }
                          ),
                        ]
                    )
                ),
              ),
              SizedBox(height: 60.h,)
            ],
          ),
        ),
      ),
),
    );
  }
}
