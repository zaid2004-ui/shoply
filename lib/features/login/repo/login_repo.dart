import 'package:dartz/dartz.dart';
import 'package:shoply_app/model/login/request_login.dart';
import 'package:shoply_app/model/login/response_login.dart';
import 'package:shoply_app/use_case/login/login_usecase.dart';

class LoginRepo {
  final _usecals = LoginUsecase();
  Future<Either<String, ResponseLogin>> login({
    required RequestLogin requestLogin,
  }) {
    return _usecals.login(requestLogin: requestLogin);
  }
}
