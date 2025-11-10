import 'package:dartz/dartz.dart';
import 'package:nutri_ai_food_calorie/domain/entity/failures.dart';
import 'package:nutri_ai_food_calorie/domain/entity/user_entity.dart';
import 'package:nutri_ai_food_calorie/domain/repository/repository/auth_repository.dart';

class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failures,UserEntity>> invoke(String email , String password , String userName){
    return authRepository.register(email, password, userName);
  }
}