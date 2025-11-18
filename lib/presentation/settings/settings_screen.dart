import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/change_password/change_password_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/favorite/favorite_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/more_settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/notifications_settings/notification_settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/payment_method_settings/payment_method_settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/profile/profile_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/widget/custom_settings_item.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = 'Settings Screen';

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
            'Settings',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              Container(
                height: 94.h,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColor.darkGreyColor),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.defaultPerson,
                      height: 54.h,
                      width: 54.w,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ibrahim',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'Ibrahim@gmail.com',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
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
                                .pushNamed(ProfileScreen.routeName);
                          },
                          child: CustomSettingsItem(text: 'Profile')),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ChangePasswordScreen.routeName);
                          },
                          child: CustomSettingsItem(text: 'Change Password')),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                NotificationSettingsScreen.routeName);
                          },
                          child: CustomSettingsItem(text: 'Notification')),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PaymentMethodSettingsScreen.routeName);
                          },
                          child: CustomSettingsItem(text: 'Payment Method')),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(FavoriteScreen.routeName);
                          },
                          child: CustomSettingsItem(text: 'Favorite')),
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
                child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(MoreSettingsScreen.routeName);
                    },
                    child: CustomSettingsItem(text: 'More')),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 65.h,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColor.darkGreyColor),
                child: InkWell(
                    onTap: () {}, child: CustomSettingsItem(text: 'Log Out')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
