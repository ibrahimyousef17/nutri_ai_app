import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  void Function() onPressed;

  String text;

  Color backgroundColor;

  CustomElevatedButton(
      {required this.onPressed,
      required this.text,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r))),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
