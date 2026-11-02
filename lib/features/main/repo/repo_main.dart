import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/use_case/cart/cart_use_case.dart';
import 'package:shoply_app/core/use_case/logout/logout_usecase.dart';

class RepoMain {
  final cartUsecase = CartUseCase();
  final logoutUseCase = LogoutUsecase();

  Future<Either<String, int>> getCount() async {
    return await cartUsecase.getCartCount();
  }

  Future<Either<String, bool>> logout() async {
    return await logoutUseCase.logout();
  }
}
