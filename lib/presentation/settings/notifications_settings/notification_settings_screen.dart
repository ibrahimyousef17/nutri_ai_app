import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/notifications_settings/cubit/notification_settings_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/notifications_settings/widget/custom_notification_item.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class NotificationSettingsScreen extends StatefulWidget {
  static const String routeName = 'Notification settings screen';

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  var viewModel = NotificationSettingsViewModel();

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
          'Notification Settings',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Container(
          height: 250.h,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColor.darkGreyColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: [
              CustomNotificationItem(
                  text: 'Meal Reminders',
                  notificationState: viewModel.mealReminders,
                  onChanged: (newValue) {
                    viewModel.mealReminders = newValue;
                    setState(() {});
                  }),
              CustomNotificationItem(
                  text: 'Progress Summary',
                  notificationState: viewModel.progressSummary,
                  onChanged: (newValue) {
                    viewModel.progressSummary = newValue;
                    setState(() {});
                  }),
              CustomNotificationItem(
                  text: 'Goal Milestone Notifications',
                  notificationState: viewModel.goalMileStoneNotifications,
                  onChanged: (newValue) {
                    viewModel.goalMileStoneNotifications = newValue;
                    setState(() {});
                  }),
              CustomNotificationItem(
                  text: 'New Plan Recommendations',
                  notificationState: viewModel.newPlanRecommendations,
                  onChanged: (newValue) {
                    viewModel.newPlanRecommendations = newValue;
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
