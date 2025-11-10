import 'package:dartz/dartz.dart';

import '../../entity/failures.dart';
import '../../entity/user_entity.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,UserEntity>> login(String email ,String password);
  Future<Either<Failures,UserEntity>> register(String email ,String password,String userName);
}