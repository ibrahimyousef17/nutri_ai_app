import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/privacy_and_policy/cubit/privacy_states.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/privacy_and_policy/cubit/privacy_view_model.dart';
import '../../../utils/app_color.dart';
import '../widget/terms_privacy_help_item.dart';

class PrivacyAndPolicyScreen extends StatelessWidget {
  static const String routeName = 'PrivacyAndPolicy';
  var viewModel = PrivacyAndPolicyViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          'Privacy And Policy',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
        child: BlocBuilder<PrivacyAndPolicyViewModel, PrivacyAndPolicyStates>(
            bloc: viewModel..loadTerms(),
            builder: (context, state) {
              if (state is PrivacyLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                );
              } else if (state is PrivacyErrorState) {
                return Center(
                  child: Text(
                    state.errorMsg,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              } else if (state is PrivacySuccessState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TermsPrivacyHelpItem(text: state.privacyList[index]);
                  },
                  itemCount: state.privacyList.length,
                );
              } else {
                return SizedBox(); // unreachable code
              }
            }),
      ),
    ));
  }
}
