import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class TermsPrivacyHelpItem extends StatelessWidget {
  String text;

  TermsPrivacyHelpItem({required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.startsWith('##')) {
      //todo: text is bullet
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Text(
                  "  •  ",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              TextSpan(
                text: text.substring(2),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.whiteColor.withOpacity(0.5),
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),
      );
    } else if (text.startsWith('#')) {
      //todo: text is header
      return Text(
        text.substring(1),
        style:
            Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.sp),
      );
    } else if (text.trim().isEmpty) {
      //todo text is empty
      return SizedBox(
        height: 12.h,
      );
    } else {
      //todo: text is paragraph
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 15.sp, color: AppColor.whiteColor.withOpacity(0.5)),
        ),
      );
    }
  }
}
