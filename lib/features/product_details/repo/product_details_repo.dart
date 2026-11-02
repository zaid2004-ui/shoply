import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/use_case/cart/cart_use_case.dart';
import 'package:shoply_app/model/cart/cart.dart';

class ProductDetailsRepo {
  final cartUseCas = CartUseCase();

  Future<Either<String, bool>> addCartProducts({required Cart cart}) async {
    return await cartUseCas.addToCart(requestCart: cart);
  }
}
