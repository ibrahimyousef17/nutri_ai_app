import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/favorite/cubit/favorite_view_model.dart';
import 'package:nutri_ai_food_calorie/presentation/settings/favorite/widget/favorite_item.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_assets.dart';

import '../../utils/app_color.dart';

class FavoriteScreen extends StatelessWidget {
  static const String routeName = 'Favorite screen';
  var viewModel = FavoriteViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
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
          ),
          title: Text(
            'Favorite',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: viewModel.favoriteList.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FavoriteItem();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 30.h,
                      );
                    },
                    itemCount: 4),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Center(
                    child: SizedBox(
                        height: 216.h,
                        width: 254.w,
                        child: Image.asset(
                          AppAssets.notificationImage,
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'No Favorite yet.',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Quick access to your most-loved \n items makes logging even faster!',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ));
  }
}
/*
Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Center(
              child: SizedBox(
                  height: 216.h,
                  width: 254.w,
                  child: Image.asset(AppAssets.notificationImage,fit: BoxFit.fill,)),
            ),
            SizedBox(height: 40.h,),
            Text('No Favorite yet.',style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
            SizedBox(height: 12.h,),
            Text('Quick access to your most-loved \n items makes logging even faster!',style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
            Spacer(),
          ],
        )
 */
