import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/verification/cubit/verification_view_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/app_color.dart';

class VerificationScreen extends StatefulWidget {
  static const String routeName = 'verification screen';

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
var viewModel = VerificationViewModel();
int seconds = 30;
Timer? timer ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  void  startTimer(){
  timer?.cancel();
  timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if(seconds>0){
      setState(() {
        seconds--;
      });
    }else{
      timer.cancel();
    }
  });
  }

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
          )
      ),
      backgroundColor: AppColor.primaryColor,
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 100.h,),
            Text('Verify Your Email Address',style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 10.h,),
            Text('Enter the code we’ve sent by text to \njanecooper@email.com',style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 40.h,),
            PinCodeTextField(
              appContext: context,
              length: 6, // عدد الخانات
              controller: viewModel.pinController,
              keyboardType: TextInputType.number,
              textStyle: Theme.of(context).textTheme.titleMedium,
              autoFocus: true,
              cursorColor: AppColor.whiteColor,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8.r),
                fieldHeight: 51.h,
                fieldWidth: 51.w,
                activeFillColor: Colors.transparent,
                activeColor: AppColor.whiteColor,
                selectedColor: Colors.blue,
                selectedFillColor: Colors.transparent,
                inactiveColor: AppColor.darkGreyColor,
                inactiveFillColor: Colors.transparent
              ),
              animationDuration: Duration(milliseconds: 300),
              onChanged: (value) {
                print("Current value: $value");
              },
              onCompleted: (value) {
                print("Completed: $value");
              },
            ),
            SizedBox(
              height: 32.h,
            ),
            Text('Didn’t receive code?',style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
            SizedBox(height: 4.h,),
            seconds>0?
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  style:  Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(text: 'Resend the code after '),
                    TextSpan(text: '$seconds',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColor.orangeColor
                    )),
                    TextSpan(text: ' seconds')
                  ]
                )
              ),
            )
                :
            TextButton(
                onPressed: (){
                  startTimer();
                  viewModel.pinController.clear();
                  setState(() {

                  });
                },
                child: Text('Resend code',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColor.orangeColor
                ),)),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(14.w),
                    backgroundColor: AppColor.orangeLightColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)
                    )
                ),
                onPressed: (){
                  //todo: verification
                },
                child:Text('Verify',style: Theme.of(context).textTheme.titleMedium,) ),
            SizedBox(height: 30.h,)
          ],
        ),
      ),
    );

  }
}
