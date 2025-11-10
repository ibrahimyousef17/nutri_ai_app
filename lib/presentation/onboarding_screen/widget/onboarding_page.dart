import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/auth/login/login_screen.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../domain/di.dart';
import '../cubit/onboarding_cubit.dart';

class OnboardingPage extends StatelessWidget {
  final Color pageColor;

  final String pageImage;

  final String title;

  final String subTitle;

  final PageController pageController;

  final bool isLastPage;

  OnboardingPage(
      {required this.pageColor,
      required this.pageImage,
      required this.title,
      required this.subTitle,
      required this.pageController,
      required this.isLastPage});

  var viewModel = OnboardingViewModel(setGoLoginUseCase: injectSetGoLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: pageColor),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Visibility(
              visible: !isLastPage,
              child: InkWell(
                onTap: (){
                  pageController.jumpToPage(2);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('SkIP',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColor.primaryColor
                    ),),
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(42.w),
                height: 360.h,
                width: 260.w,
                child: Image.asset(pageImage, fit: BoxFit.fill)),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppColor.primaryColor),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.primaryColor),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
                controller: pageController,  // PageController
                count:  3,
                effect:  SwapEffect(),  // your preferred effect
                onDotClicked: (index){
                }
            )
          ],
        ),
      ),
      Positioned(
        bottom: 25,
        child: InkWell(
          onTap: () async {
            if (isLastPage) {
              viewModel.seGoLogin();
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            } else {
              pageController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            }
          },
          child: Container(
            height: 110.h,
            width: 110.w,
            decoration: BoxDecoration(
                color: AppColor.whiteColor.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2, 2))
                ]),
            child: Center(
              child: isLastPage
                  ? Text(
                      'Get Started',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColor.primaryColor),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColor.primaryColor),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 30.sp,
                          color: AppColor.primaryColor,
                        )
                      ],
                    ),
            ),
          ),
        ),
      )
    ]);
  }
}
