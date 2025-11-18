import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/profile/cubit/profile_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/profile/widget/custom_profile_text_field.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/Custom_Elevated_button.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';

import '../../utils/app_color.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profile screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var viewModel = ProfileViewModel();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.name = 'ibrahim';
    viewModel.email = 'ibrahim@gmail.com';
    viewModel.dob = '17/2/2004';
    viewModel.gender = 'Male';
    viewModel.height = '165';
    viewModel.weight = '54';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'My Profile',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.asset(
                    AppAssets.defaultPerson,
                    height: 84.h,
                    width: 84.w,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: AppColor.darkGreyColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColor.whiteColor,
                          size: 20.sp,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 54.h,
            ),
            Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  CustomProfileTextField(
                    textName: 'Name',
                    onChanged: (newName) {
                      viewModel.name = newName;
                    },
                    initialValue: viewModel.name,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomProfileTextField(
                    textName: 'Email',
                    onChanged: (newEmail) {
                      viewModel.email = newEmail;
                    },
                    initialValue: viewModel.email,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomProfileTextField(
                            textName: 'DOB',
                            onChanged: (newDate) {
                              viewModel.dob = newDate;
                            },
                            initialValue: viewModel.dob),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: CustomProfileTextField(
                            textName: 'Gender',
                            onChanged: (newGender) {
                              viewModel.gender = newGender;
                            },
                            initialValue: viewModel.gender),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomProfileTextField(
                            textName: 'Height',
                            onChanged: (newHeight) {
                              viewModel.height = newHeight;
                            },
                            initialValue: viewModel.height),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: CustomProfileTextField(
                            textName: 'Weight',
                            onChanged: (newWeight) {
                              viewModel.weight = newWeight;
                            },
                            initialValue: viewModel.weight),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 149.h,
            ),
            CustomElevatedButton(
                onPressed: () {
                  //todo: save changes
                  print(viewModel.name);
                },
                text: 'Save',
                backgroundColor: AppColor.orangeLightColor)
          ],
        ),
      ),
    );
  }
}
