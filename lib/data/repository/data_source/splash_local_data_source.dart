import 'package:nutri_ai_food_calorie/data/data_base/shared_pref/shared_preference.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/splash_local_data_source.dart';

class SplashLocalDataSourceImpl implements SplashLocalDataSource{
  SharedPref sharedPref ;
  SplashLocalDataSourceImpl({required this.sharedPref});
  @override
  bool? goLoginOrBoarding() {
    return sharedPref.goLoginOrBoarding();
  }

}