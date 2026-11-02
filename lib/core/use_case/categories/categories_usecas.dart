import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/utils/constants/firestore_collections.dart';
import 'package:shoply_app/model/categories/response_category.dart';

class CategoriesUsecas {
  Future<Either<String, List<ResponseCategory>>> getCategories() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(FirestoreCollections.categories)
          .get();

      final List<ResponseCategory> categoriesData = [];
      for (var temp in snapshot.docs) {
        categoriesData.add(ResponseCategory.fromJson(temp.data()));
      }
      return Right(categoriesData);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }
}
