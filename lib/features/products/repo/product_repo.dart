import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/use_case/products/products_usecas.dart';
import 'package:shoply_app/model/products/response_products.dart';

class ProductRepo {
  final products = ProductsUsecas();
  Future<Either<String, List<ResponseProducts>>> getProducts(
    String categoryId,
  ) async {
    return await products.getProducts(categoryId: categoryId);
  }
}
