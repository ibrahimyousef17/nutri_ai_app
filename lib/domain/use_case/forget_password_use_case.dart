import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/auth_repository.dart';

class ForgetPasswordUseCase {
  AuthRepository authRepository;

  ForgetPasswordUseCase({required this.authRepository});

  Future<Either<Failures, void>> invoke(String email) {
    return authRepository.forgetPassword(email);
  }
}
