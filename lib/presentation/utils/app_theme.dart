import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class AppTheme {
 static ThemeData appTheme =ThemeData(
   primaryColor: AppColor.primaryColor,
   scaffoldBackgroundColor: AppColor.primaryColor,
   textTheme: TextTheme(
   titleLarge: TextStyle(
     fontSize: 28.sp,
     fontWeight: FontWeight.w500,
     color: AppColor.whiteColor
   ),
       bodyLarge: TextStyle(
     fontSize: 24.sp,
     fontWeight: FontWeight.w500,
     color: AppColor.whiteColor
   ),
   titleMedium: TextStyle(
     fontSize: 17.sp,
     fontWeight: FontWeight.w400,
     color: AppColor.whiteColor
   )
   )
 );
}