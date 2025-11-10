abstract class AuthStates {}

class AuthInitialState extends AuthStates{}
class AuthExistUser extends AuthStates{}
class AuthClearUser extends AuthStates{}