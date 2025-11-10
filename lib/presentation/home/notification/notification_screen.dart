import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';

import '../../utils/app_color.dart';

class NotificationScreen extends StatelessWidget {
static const String routeName = 'notification screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.darkGreyColor,
                    shape: CircleBorder(
                    )
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                }, child: Icon(Icons.arrow_back_ios,size: 20.sp,color: AppColor.whiteColor,)),
          ),
        title: Text('Notifications',style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Center(
            child: SizedBox(
              height: 216.h,
                width: 254.w,
                child: Image.asset(AppAssets.notificationImage,fit: BoxFit.fill,)),
          ),
          SizedBox(height: 40.h,),
          Text('No notifications yet.',style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
          SizedBox(height: 12.h,),
          Text('Your healthy habits are on \n track—keep it up!',style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
          Spacer(),
        ],
      )
    );
  }
}
