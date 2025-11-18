import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class CustomSettingsItem extends StatelessWidget {
  String text;

  CustomSettingsItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20.sp,
          color: AppColor.whiteColor,
        )
      ],
    );
  }
}
