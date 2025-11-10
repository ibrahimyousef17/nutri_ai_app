

abstract class Failures {
  String errorMessage ;
  Failures({required this.errorMessage});
}

class NetworkError extends Failures {
  NetworkError({required super.errorMessage});
}
class ServerError extends Failures{
  ServerError({required super.errorMessage});
}

class LocalError extends Failures{
  LocalError({required super.errorMessage});
}

class UserCancelledError extends Failures{
  UserCancelledError({required super.errorMessage});
}