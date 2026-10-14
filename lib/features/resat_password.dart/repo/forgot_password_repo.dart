import 'package:dartz/dartz.dart';
import 'package:shoply_app/use_case/forgot_password/forgot_password_usecase.dart';

class ForgotPasswordRepo {
  final _usecase = ForgotPasswordUsecase();
  Future<Either<String, bool>> forgotPassword({required String emile}) {
    return _usecase.forgotPassword(email: emile);
  }
}
