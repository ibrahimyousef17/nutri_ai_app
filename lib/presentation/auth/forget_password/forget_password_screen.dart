import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/forget_password/cubit/forget_password_screen_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/login_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/reset_password/reset_password_screen.dart';

import '../../utils/app_color.dart';
import '../widget/item_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forget password screen';
  var viewModel = ForgetPasswordScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
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

      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100.h,),
            Text('Forgot Your Password?',style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 10.h,),
            Text('No worries! Enter your email, and we’ll \nsend you a reset link.',style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 48.h,),
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
                ],
              ),
            ),
            Spacer(),
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
                    //todo: forgot password
                    Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
                  }
                },
                child:Text('Send Reset Link',style: Theme.of(context).textTheme.titleMedium,) ),
            SizedBox(height: 24.h,),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                },
                  child: Text('Bact To Login',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.orangeColor
                  ),)),
            )
          ],
        ),
      ),
    );
  }
}
