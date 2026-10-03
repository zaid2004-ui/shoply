import 'package:shoply_app/model/product_user.dart';
import 'package:shoply_app/model/user_product.dart';

class ModelProduct {
  final String status;
  final String message;
  final UserProduct use;
  final List<ProductUser> products;

  ModelProduct({
    required this.status,
    required this.message,
    required this.use,
    required this.products,
  });

  factory ModelProduct.fromJson(Map<String, dynamic> json) {
    List<ProductUser> productList = [];
    final productsJson = json['products'] as List<dynamic>;
    for (var temp in productsJson) {
      productList.add(ProductUser.fromJson(temp));
    }

    return ModelProduct(
      status: json['status'],
      message: json['message'],
      use: UserProduct.fromJson(json['user']),
      products: productList,
    );
  }
}
