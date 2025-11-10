import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/reset_password/cubit/reset_password_view_model.dart';

import '../../utils/app_color.dart';
import '../widget/item_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = 'reset password screen';

var viewModel = ResetPasswordScreenViewModel();
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
            Text('Reset Your Password',style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 10.h,),
            Text('Enter a new password to regain access \nto your account.',style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 48.h,),
            Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  ItemTextFormField(
                    controller: viewModel.newPasswordController,
                    hintText: 'enter your new password',
                    validate: (newPassword){
                      if(newPassword==null|| newPassword.isEmpty){
                        return 'please enter your new password' ;
                      }
                      if(newPassword.length<6){
                        return 'the password must be at least six numbers' ;
                      }
                      return null ;
                    },
                    obscureText: true,
                    textName: 'New Password',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20.h,),
                  ItemTextFormField(
                    controller: viewModel.confirmPasswordController,
                    hintText: 'enter confirm password',
                    validate: (confirmPassword){
                      if(confirmPassword==null|| confirmPassword.isEmpty){
                        return 'please enter confirm password' ;
                      }
                      if(confirmPassword != viewModel.newPasswordController.text){
                        return 'confirm password must be same new password' ;
                      }
                      return null ;
                    },
                    obscureText: true,
                    textName: 'Confirm Password',
                    keyboardType: TextInputType.number,
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
                    //todo: reset password
                  }
                },
                child:Text('Send Reset Link',style: Theme.of(context).textTheme.titleMedium,) ),
            SizedBox(height: 24.h,),
          ],
        ),
      ),
    );
  }
}
