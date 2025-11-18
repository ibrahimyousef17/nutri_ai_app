import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class CustomProfileTextField extends StatelessWidget {
  String textName;

  void Function(String)? onChanged;

  TextInputType keyboardType;

  String initialValue;

  CustomProfileTextField(
      {required this.textName,
      required this.onChanged,
      this.keyboardType = TextInputType.text,
      required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          textName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          onChanged: onChanged,
          initialValue: initialValue,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: AppColor.darkGreyColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.blueAccent)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.redAccent)),
          ),
        ),
      ],
    );
  }
}
