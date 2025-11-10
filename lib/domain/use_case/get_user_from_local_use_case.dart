import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/auth_repository.dart';

class GetUserFromLocalUseCase {
  AuthRepository authRepository;
  GetUserFromLocalUseCase({required this.authRepository});

  Either<Failures, UserEntity> invoke(){
    return authRepository.getUserFromShared();
  }
}