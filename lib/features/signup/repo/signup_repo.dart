import 'package:dartz/dartz.dart';
import 'package:shoply_app/model/signup/request_signup.dart';
import 'package:shoply_app/use_case/signup/signup_usecase.dart';

class SignupRepo {
  final _usecase = SignupUsecase();
  Future<Either<String, bool>> signup({
    required String password,
    required RequestSignup requestSignup,
  }) {
    return _usecase.signup(password: password, requestSignup: requestSignup);
  }
}
