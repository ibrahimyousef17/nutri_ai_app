import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/help/help_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/privacy_and_policy/privacy_and_policy_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/terms_and_condition/terms_and_condition_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/widget/custom_settings_item.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class MoreSettingsScreen extends StatelessWidget {
  static const String routeName = 'More Settings Screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
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
            'More',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColor.darkGreyColor),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(TermsAndConditionScreen.routeName);
                          },
                          child:
                              CustomSettingsItem(text: 'Terms and Conditions')),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(PrivacyAndPolicyScreen.routeName);
                          },
                          child: CustomSettingsItem(text: 'Privacy Policy')),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(HelpScreen.routeName);
                          },
                          child: CustomSettingsItem(text: 'Helps')),
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 65.h,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColor.darkGreyColor),
                child: CustomSettingsItem(text: 'Delete Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
