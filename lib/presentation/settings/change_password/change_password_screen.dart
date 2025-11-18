import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/change_password/cubit/change_password_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/Custom_Elevated_button.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/item_text_form_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routeName = 'Change password screen';
  var viewModel = ChangePasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.all(8.w),
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.darkGreyColor,
                ),
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios,
                  size: 20.sp,
                  color: AppColor.whiteColor,
                )),
              ),
            ),
            title: Text(
              'Change Password',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
            child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ItemTextFormField(
                        controller: viewModel.newPassword,
                        validate: (newPassword) {
                          if (newPassword == null || newPassword.isEmpty) {
                            return 'please enter new password';
                          }
                          if (newPassword.length < 6) {
                            return 'The password must be 6 number or more';
                          }
                          return null;
                        },
                        textName: 'New Password',
                        hintText: 'enter your new password'),
                    SizedBox(
                      height: 20.h,
                    ),
                    ItemTextFormField(
                        controller: viewModel.confirmPassword,
                        validate: (confirmPassword) {
                          if (confirmPassword == null ||
                              confirmPassword.isEmpty) {
                            return 'please enter new password';
                          }
                          if (confirmPassword != viewModel.newPassword.text) {
                            return 'confirm password must equal new password';
                          }
                          return null;
                        },
                        textName: 'Confirm Password',
                        hintText: 'enter your confirm password'),
                    Spacer(),
                    SizedBox(
                        height: 50.h,
                        child: CustomElevatedButton(
                            onPressed: () {
                              //todo: save changes
                            },
                            text: 'Save',
                            backgroundColor: AppColor.orangeLightColor)),
                  ],
                )),
          )),
    );
  }
}
