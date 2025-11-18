import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/terms_and_condition/cubit/terms_and_condition_states.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/terms_and_condition/cubit/terms_and_condition_view_model.dart';

import '../../../utils/app_color.dart';
import '../widget/terms_privacy_help_item.dart';

class TermsAndConditionScreen extends StatelessWidget {
  static const String routeName = 'termsAndCondition';
  var viewModel = TermsAndConditionViewModel();

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
          'Terms And Condition',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
        child: BlocBuilder<TermsAndConditionViewModel, TermsAndConditionStates>(
            bloc: viewModel..loadTerms(),
            builder: (context, state) {
              if (state is TermsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                );
              } else if (state is TermsErrorState) {
                return Center(
                  child: Text(
                    state.errorMsg,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              } else if (state is TermsSuccessState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TermsPrivacyHelpItem(text: state.termsList[index]);
                  },
                  itemCount: state.termsList.length,
                );
              } else {
                return SizedBox(); // unreachable code
              }
            }),
      ),
    ));
  }
}
