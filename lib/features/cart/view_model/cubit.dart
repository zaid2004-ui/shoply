import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/cart/repo/repo_cart.dart';
import 'package:shoply_app/features/cart/view_model/state.dart';
import 'package:shoply_app/model/cart/cart.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitState());

  final repoCart = RepoCart();
  final List<Cart> responsCart = [];
  //refresh
  Future<void> refreshCart() async {
    responsCart.clear();

    await getCart();
  }

  // get cart

  Future<void> getCart() async {
    final result = await repoCart.getCart();
    result.fold(
      (errorMessage) {
        emit(CartErrorState(errorMessage: errorMessage));
      },
      (responsCart) {
        this.responsCart.addAll(responsCart);

        emit(CartSuccessState());
      },
    );
  }
}
