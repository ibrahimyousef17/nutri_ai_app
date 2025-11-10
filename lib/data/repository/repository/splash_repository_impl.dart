import 'package:nutri_ai_food_calorie/data/repository/data_source/splash_local_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/data_source/splash_local_data_source.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository{
  SplashLocalDataSource splashLocalDataSource;
  SplashRepositoryImpl({required this.splashLocalDataSource});
  @override
  bool? goLoginOrBoarding() {
    return splashLocalDataSource.goLoginOrBoarding();
  }

}