import 'package:dartz/dartz.dart';

import '../entity/failures.dart';
import '../entity/user_entity.dart';
import '../repository/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures,UserEntity>> invoke(String email , String password){
    return authRepository.login(email, password);
  }
}