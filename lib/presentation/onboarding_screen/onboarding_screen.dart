import 'package:flutter/material.dart';
import 'package:nutri_ai_food_calorie/presentation/onboarding_screen/widget/onboarding_page.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

import 'cubit/onboarding_cubit.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding screen';
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;
bool isLastPage = false ;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {

    List<OnboardingPage> pages = [
      OnboardingPage(
        pageColor: AppColor.greyColor,
        pageImage: 'assets/images/onboarding_image_page_one.png',
        title: 'Your Smart Nutrition \n Companion',
        subTitle: 'Track your meals, monitor nutrients, and\n reach your health goals with AI-powered support.',
        pageController: controller,
        isLastPage: isLastPage,
      ),
      OnboardingPage(
        pageColor: AppColor.greenColor,
        pageImage: 'assets/images/onboarding_image_page_two.png',
        title: 'Track Everything That \n Matters',
        subTitle: 'Log calories, macros, water, and activity\n —all in one place.',
        pageController: controller,
        isLastPage:  isLastPage,
      ),
      OnboardingPage(
        pageColor: AppColor.orangeColor,
        pageImage: 'assets/images/onboarding_image_page_three.png',
        title: 'Your Health Journey \n Starts Here',
        subTitle: 'We help you choose healthier foods and enjoy \n tasty, nutritious meals for your well-being.',
        pageController: controller,
        isLastPage:  isLastPage,
      ),
    ];

    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index){
          isLastPage = index==2;
          setState(() {

          });
        },
        children: pages
      ),
    );
  }


}
