import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/local/local_storage_user.dart';
import 'package:shoply_app/core/utils/constants/firestore_collections.dart';
import 'package:shoply_app/model/cart/cart.dart';

class CartUseCase {
  //add to cart
  Future<Either<String, bool>> addToCart({required Cart requestCart}) async {
    try {
      final snapshot = FirebaseFirestore.instance
          .collection(FirestoreCollections.users)
          .doc(LocalStorageUser.instens.uid)
          .collection(FirestoreCollections.cart)
          .doc(requestCart.id);

      final cartRef = await snapshot.get();

      if (cartRef.exists) {
        await cartRef.reference.update({
          'quantity': FieldValue.increment(requestCart.quantity ?? 0),
        });
      } else {
        await cartRef.reference.set(requestCart.toJson());
      }
      return Right(true);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }
  //get cart

  Future<Either<String, List<Cart>>> getCart() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(FirestoreCollections.users)
          .doc(LocalStorageUser.instens.uid)
          .collection(FirestoreCollections.cart)
          .get();
      final List<Cart> cartData = [];

      for (var temp in snapshot.docs) {
        cartData.add(Cart.fromJson(temp.data()));
      }
      return Right(cartData);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }

  //delet products

  Future<Either<String, bool>> deletProduct({required String productId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirestoreCollections.users)
          .doc(LocalStorageUser.instens.uid)
          .collection(FirestoreCollections.cart)
          .doc(productId)
          .delete();

      return Right(true);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }

  //delet all products

  Future<Either<String, bool>> deletAllProducts({
    required String productId,
  }) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(FirestoreCollections.users)
          .doc(LocalStorageUser.instens.uid)
          .collection(FirestoreCollections.cart)
          .get();

      for (var temp in snapshot.docs) {
        await temp.reference.delete();
      }

      return Right(true);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }

  // udate quantity

  Future<Either<String, bool>> updateQuantity({
    required int quantity,
    required String productId,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirestoreCollections.users)
          .doc(LocalStorageUser.instens.uid)
          .collection(FirestoreCollections.cart)
          .doc(productId)
          .update({'quantity': quantity});
      return Right(true);
    } on FirebaseException catch (e) {
      return left(e.message ?? '');
    }
  }

  //get cart count
  Future<Either<String, int>> getCartCount() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(FirestoreCollections.users)
          .doc(LocalStorageUser.instens.uid)
          .collection(FirestoreCollections.cart)
          .get();
      return Right(snapshot.docs.length);
    } on FirebaseException catch (e) {
      return Left(e.message ?? '');
    }
  }
}
