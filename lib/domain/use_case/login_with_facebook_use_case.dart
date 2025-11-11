import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/auth_repository.dart';

class LoginWithFacebookUseCase {
  AuthRepository authRepository;

  LoginWithFacebookUseCase({required this.authRepository});

  Future<Either<Failures, UserEntity>> invoke() {
    return authRepository.loginWithFacebook();
  }
}
