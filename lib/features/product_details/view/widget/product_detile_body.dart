import 'package:flutter/material.dart';
import 'package:shoply_app/model/products/response_products.dart';

class ProductDetileBody extends StatelessWidget {
  const ProductDetileBody({super.key, required this.responseProducts});
  final ResponseProducts responseProducts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            responseProducts.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.onSurface,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '\$ ${responseProducts.price}',
            textAlign: TextAlign.start,

            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: theme.primary,
            ),
          ),
          SizedBox(height: 20),
          Text(
            responseProducts.description,
            textAlign: TextAlign.start,

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: theme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
