import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/cubit/auth_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/settings_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

import 'notification/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.darkGreyColor,
                  child: Icon(Icons.person,size: 25.sp,color: AppColor.whiteColor,)),
              SizedBox(width: 12.w,),
              Text(AuthViewModel.getProvider(context).currentUser!.userName,style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.w,
                color: AppColor.darkGreyColor
              )
            ),
            child: Icon(Icons.workspace_premium,size: 24.sp,color: AppColor.whiteColor,),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.w,
                  color: AppColor.darkGreyColor
                )
              ),
              child: Icon(Icons.notification_important_outlined,size: 24.sp,color: AppColor.whiteColor,),
            ),
          ),
        ],
      ),
    );
  }
}
