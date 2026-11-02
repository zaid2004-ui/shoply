import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/utils/constants/firestore_collections.dart';
import 'package:shoply_app/model/order/product_order.dart';

class CheckoutUsecase {
  Future<Either<String, bool>> chekOout({
    required ProductOrder requestProductsOrder,
  }) async {
    try {
      final orderId = FirebaseFirestore.instance
          .collection(FirestoreCollections.orders)
          .doc()
          .id;
      requestProductsOrder.id = orderId;
      await FirebaseFirestore.instance
          .collection(FirestoreCollections.orders)
          .doc(orderId)
          .set(requestProductsOrder.toJson());
      return Right(true);
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    }
  }
}
