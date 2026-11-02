import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/products/repo/product_repo.dart';
import 'package:shoply_app/features/products/view_model/state.dart';
import 'package:shoply_app/model/products/response_products.dart';

class CubitProducts extends Cubit<ProductsState> {
  CubitProducts() : super(InitStateProducts());
  final productsRepo = ProductRepo();
  final List<ResponseProducts> responsProducts = [];

  Future<void> refreshProducts(String categoryId) async {
    responsProducts.clear();
    await getProducts(categoryId: categoryId);
  }

  Future<void> getProducts({required String categoryId}) async {
    emit(LodingStateProducts());
    final reslut = await productsRepo.getProducts(categoryId);

    reslut.fold(
      (errorMessage) {
        emit(ErorregStateProducts(errorMessage: errorMessage));
      },
      (responsProducts) {
        this.responsProducts.addAll(responsProducts);
        emit(SucsesegStateProducts());
      },
    );
  }
}
