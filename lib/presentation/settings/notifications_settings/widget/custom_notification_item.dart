import 'package:flutter/material.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class CustomNotificationItem extends StatelessWidget {
  String text;

  bool notificationState;

  void Function(bool)? onChanged;

  CustomNotificationItem(
      {required this.text,
      required this.notificationState,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Switch(
          inactiveTrackColor: AppColor.greyColor.withOpacity(0.5),
          inactiveThumbColor: AppColor.whiteColor,
          activeTrackColor: AppColor.orangeLightColor,
          activeColor: AppColor.whiteColor,
          value: notificationState,
          onChanged: onChanged,
        )
      ],
    );
  }
}
