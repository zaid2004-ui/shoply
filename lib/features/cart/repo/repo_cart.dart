import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/use_case/cart/cart_use_case.dart';
import 'package:shoply_app/core/use_case/checkout/checkout_usecase.dart';
import 'package:shoply_app/model/cart/cart.dart';
import 'package:shoply_app/model/order/product_order.dart';

class RepoCart {
  final cartUseCase = CartUseCase();
  final chekOut = CheckoutUsecase();

  // checkout set

  Future<Either<String, bool>> checkOut({
    required ProductOrder requestProductsOrder,
  }) async {
    return await chekOut.chekOout(requestProductsOrder: requestProductsOrder);
  }

  //get cart
  Future<Either<String, List<Cart>>> getCart() async {
    return await cartUseCase.getCart();
  }

  //delet product

  Future<Either<String, bool>> deletProduct({required String productId}) async {
    return await cartUseCase.deletProduct(productId: productId);
  }

  //delet all product
  Future<Either<String, bool>> deletAllProduct({
    required String productId,
  }) async {
    return await cartUseCase.deletAllProducts(productId: productId);
  }

  //update qantit
  Future<Either<String, bool>> updateQantit({
    required int quantity,
    required String productId,
  }) async {
    return await cartUseCase.updateQuantity(
      quantity: quantity,
      productId: productId,
    );
  }
}
