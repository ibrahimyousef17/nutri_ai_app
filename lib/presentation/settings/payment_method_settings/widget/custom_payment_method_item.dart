import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class CustomPaymentItem extends StatelessWidget {
  String text;

  String imagePath;

  CustomPaymentItem({required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          color: AppColor.darkGreyColor,
          borderRadius: BorderRadius.circular(24.r)),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 70.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(width: 1, color: AppColor.greyColor)),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 50.w,
                height: 20.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
