import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoply_app/core/utils/constants/firestore_collections.dart';
import 'package:shoply_app/model/sales/respons_sales.dart';

class SalesUsecas {
  Future<Either<String, List<ResponsSales>>> getSales() async {
    try {
      final sealsSnapshot = await FirebaseFirestore.instance
          .collection(FirestoreCollections.sales)
          .get();
      final List<ResponsSales> sealsData = [];
      for (var temp in sealsSnapshot.docs) {
        sealsData.add(ResponsSales.fromJson(temp.data()));
      }
      return Right(sealsData);
    } on FirebaseException catch (e) {
      return left(e.message ?? ' ');
    }
  }
}
