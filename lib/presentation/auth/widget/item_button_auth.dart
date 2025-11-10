import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_color.dart';

class ItemButtonAuth extends StatelessWidget {
  String buttonText ;
  String iconPath ;
  void Function() onPressed ;
  ItemButtonAuth({required this.buttonText,required this.iconPath,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.darkGreyColor,
            padding: EdgeInsets.all(14.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)
            )
        ),
        onPressed:onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath,width: 24.h,height: 24.h,fit: BoxFit.fill,),
            SizedBox(width: 12.w,),
            Text(buttonText,style: Theme.of(context).textTheme.titleMedium,)
          ],
        ));
  }
}
