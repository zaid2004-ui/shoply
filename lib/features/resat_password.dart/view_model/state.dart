abstract class ForgotPasswordState {}

class ForgotInitState extends ForgotPasswordState {}

class ForgotLodingState extends ForgotPasswordState {}

class ForgotErorroState extends ForgotPasswordState {
  final String errorMessage;

  ForgotErorroState({required this.errorMessage});
}

class ForgotSucsseState extends ForgotPasswordState {
  final String successMessage;

  ForgotSucsseState({required this.successMessage});
}
