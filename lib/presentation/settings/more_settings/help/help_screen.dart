import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/more_settings/help/cubit/help_states.dart';
import '../../../utils/app_color.dart';
import '../widget/terms_privacy_help_item.dart';
import 'cubit/help_view_model.dart';

class HelpScreen extends StatelessWidget {
  static const String routeName = 'helpPolicy';
  var viewModel = HelpViewModel();

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
          'Help',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
        child: BlocBuilder<HelpViewModel, HelpStates>(
            bloc: viewModel..loadTerms(),
            builder: (context, state) {
              if (state is HelpLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                );
              } else if (state is HelpErrorState) {
                return Center(
                  child: Text(
                    state.errorMsg,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              } else if (state is HelpSuccessState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TermsPrivacyHelpItem(text: state.helpList[index]);
                  },
                  itemCount: state.helpList.length,
                );
              } else {
                return SizedBox(); // unreachable code
              }
            }),
      ),
    ));
  }
}
