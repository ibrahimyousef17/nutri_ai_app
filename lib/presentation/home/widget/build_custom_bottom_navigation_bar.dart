import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_color.dart';

class BuildCustomBottomNavigationBar extends StatefulWidget {
  @override
  State<BuildCustomBottomNavigationBar> createState() =>
      _BuildCustomBottomNavigationBarState();
}

class _BuildCustomBottomNavigationBarState
    extends State<BuildCustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.h,
        width: 314.w,
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: AppColor.darkGreyColor,
            borderRadius: BorderRadius.circular(100.r)),
        child: Center(
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: selectedIndex,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Container(
                          height: selectedIndex == 0 ? 54.h : 44.h,
                          width: 54.w,
                          decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? AppColor.orangeLightColor
                                  : AppColor.greyColor.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.home,
                            size: selectedIndex == 0 ? 30.sp : 24.sp,
                            color: AppColor.whiteColor,
                          )),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Container(
                          height: selectedIndex == 1 ? 54.h : 44.h,
                          width: 54.w,
                          decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? AppColor.orangeLightColor
                                  : AppColor.greyColor.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.qr_code_scanner,
                            size: selectedIndex == 1 ? 30.sp : 24.sp,
                            color: AppColor.whiteColor,
                          )),
                      label: 'Scanning'),
                  BottomNavigationBarItem(
                      icon: Container(
                          height: selectedIndex == 2 ? 54.h : 44.h,
                          width: 54.w,
                          decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? AppColor.orangeLightColor
                                  : AppColor.greyColor.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.fastfood,
                            size: selectedIndex == 2 ? 30.sp : 24.sp,
                            color: AppColor.whiteColor,
                          )),
                      label: 'My Diets'),
                  BottomNavigationBarItem(
                      icon: Container(
                          height: selectedIndex == 3 ? 54.h : 44.h,
                          width: 54.w,
                          decoration: BoxDecoration(
                              color: selectedIndex == 3
                                  ? AppColor.orangeLightColor
                                  : AppColor.greyColor.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.settings,
                            size: selectedIndex == 3 ? 30.sp : 24.sp,
                            color: AppColor.whiteColor,
                          )),
                      label: 'Settings'),
                ]),
          ),
        ));
  }
}
