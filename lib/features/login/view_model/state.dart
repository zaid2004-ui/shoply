abstract class LoginState {}

class InitStateLogin extends LoginState {}

class LodingStateLogin extends LoginState {}

class ErorrSstateLogin extends LoginState {
  final String errorMessage;

  ErorrSstateLogin({required this.errorMessage});
}

class SucssStateLogin extends LoginState {}
