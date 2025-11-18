import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class FavoriteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                AppAssets.favoriteImage,
                fit: BoxFit.fill,
                height: 220.h,
                width: 388.w,
              )),
          Positioned(
            top: 12.h,
            right: 12.w,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.favorite,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
            ),
          )
        ]),
        SizedBox(
          height: 12.h,
        ),
        Text(
          'Food Name',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 18.sp),
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '2000 KCaL',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 13.sp),
            ),
            Text(
              'Protein 180 g',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 13.sp),
            ),
            Text(
              'Carbs 150 g',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 13.sp),
            ),
            Text(
              'Fat 80g',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 13.sp),
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Divider(
          thickness: 1,
          color: AppColor.darkGreyColor,
        )
      ],
    );
  }
}
