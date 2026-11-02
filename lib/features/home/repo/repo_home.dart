import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/use_case/categories/categories_usecas.dart';
import 'package:shoply_app/core/use_case/products/products_usecas.dart';
import 'package:shoply_app/core/use_case/sales/sales_usecas.dart';
import 'package:shoply_app/model/categories/response_category.dart';
import 'package:shoply_app/model/products/response_products.dart';
import 'package:shoply_app/model/sales/respons_sales.dart';

class RepoHome {
  final _salesUsecase = SalesUsecas();
  final _categoryUseCase = CategoriesUsecas();
  final _productUseCase = ProductsUsecas();

  Future<Either<String, List<ResponsSales>>> getSales() async {
    return await _salesUsecase.getSales();
  }

  Future<Either<String, List<ResponseCategory>>> getCtegory() async {
    return await _categoryUseCase.getCategories();
  }

  Future<Either<String, List<ResponseProducts>>> getProducts(
    String categoryId,
  ) async {
    return await _productUseCase.getProducts(categoryId: categoryId);
  }

  Future<Either<String, List<ResponseProducts>>> getTrendingProducts() async {
    return await _productUseCase.getTrindingProducts();
  }
}
