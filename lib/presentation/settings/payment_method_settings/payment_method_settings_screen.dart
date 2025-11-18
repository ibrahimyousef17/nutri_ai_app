import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/payment_method_settings/widget/custom_payment_method_item.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';

import '../../utils/app_color.dart';

class PaymentMethodSettingsScreen extends StatelessWidget {
  static const String routeName = 'payment method setting screen';

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
          elevation: 0,
          title: Text(
            'Payment Method',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
          child: Column(
            children: [
              CustomPaymentItem(
                  text: 'Google Play', imagePath: AppAssets.googlePay),
              SizedBox(
                height: 20.h,
              ),
              CustomPaymentItem(
                  text: 'Apple Play', imagePath: AppAssets.applePay),
              SizedBox(
                height: 20.h,
              ),
              CustomPaymentItem(
                  text: 'Visa Play', imagePath: AppAssets.visaPay),
            ],
          ),
        ),
      ),
    );
  }
}
