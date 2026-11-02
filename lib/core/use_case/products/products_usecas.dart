import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoply_app/core/utils/constants/firestore_collections.dart';
import 'package:shoply_app/model/products/response_products.dart';

class ProductsUsecas {
  Future<Either<String, List<ResponseProducts>>> getTrindingProducts() async {
    //get trenidng products
    try {
      final productSnapshot = await FirebaseFirestore.instance
          .collectionGroup(FirestoreCollections.products)
          .where('isTrending', isEqualTo: true)
          .get();

      final List<ResponseProducts> productData = [];
      for (var temp in productSnapshot.docs) {
        productData.add(ResponseProducts.fromJson(temp.data()));
      }
      return right(productData);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? '');
    }
  }

  //get all products
  Future<Either<String, List<ResponseProducts>>> getProducts({
    required String categoryId,
  }) async {
    try {
      final productSnapshot = await FirebaseFirestore.instance
          .collection(FirestoreCollections.categories)
          .doc(categoryId)
          .collection(FirestoreCollections.products)
          .get();
      final List<ResponseProducts> productData = [];
      for (var temp in productSnapshot.docs) {
        productData.add(ResponseProducts.fromJson(temp.data()));
      }
      return right(productData);
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? '');
    }
  }
}
