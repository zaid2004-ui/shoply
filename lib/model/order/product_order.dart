import 'package:shoply_app/model/cart/cart.dart';

class ProductOrder {
  String? id;
  final String? userUid;
  final String? fullName;
  final String? phone;
  final double? subTotal;
  final String? status;
  final List<Cart>? cart;

  ProductOrder({
    this.id,
    required this.userUid,
    required this.fullName,
    required this.phone,
    required this.subTotal,
    required this.status,
    required this.cart,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userUid': userUid,
      'fullName': fullName,
      'phone': phone,
      'subTotal': subTotal,
      'status': status,
      'cart': cart?.map((cart) => cart.toJson()).toList(),
    };
  }
}
