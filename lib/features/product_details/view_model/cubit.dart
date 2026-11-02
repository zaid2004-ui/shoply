import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/product_details/repo/product_details_repo.dart';
import 'package:shoply_app/features/product_details/view_model/state.dart';
import 'package:shoply_app/model/cart/cart.dart';

class CubitProductDitle extends Cubit<ProductDetailsState> {
  CubitProductDitle() : super(ProductDetailsInitstate());

  final repoPorductDetile = ProductDetailsRepo();
  final controller = PageController();

  int quantite = 1;

  void incrementQuantity() {
    if (quantite < 10) {
      quantite++;
      emit(ProductDetailsChangeQuantityState());
    }
  }

  void decrementQuantity() {
    if (quantite > 1) {
      quantite--;
      emit(ProductDetailsChangeQuantityState());
    }
  }

  Future<void> addToCart({
    required Cart requestCart,
    required BuildContext context,
  }) async {
    emit(ProductDetailsAddToCartLoadingState());
    final result = await repoPorductDetile.addCartProducts(cart: requestCart);

    result.fold(
      (erroteMessage) {
        emit(ProductDetailsAddToCartErrorState(errorMessage: erroteMessage));
      },
      (_) {
        emit(ProductDetailsAddToCartSuccessState());
      },
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
