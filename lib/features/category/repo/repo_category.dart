import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/use_case/categories/categories_usecas.dart';
import 'package:shoply_app/model/categories/response_category.dart';

class RepoCategory {
  final _category = CategoriesUsecas();
  Future<Either<String, List<ResponseCategory>>> getCateglry() async {
    return await _category.getCategories();
  }
}
