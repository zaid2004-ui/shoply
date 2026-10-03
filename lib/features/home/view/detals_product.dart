import 'package:flutter/material.dart';
import 'package:shoply_app/model/model_product.dart';

class DetalsProduct extends StatelessWidget {
  final ModelProduct model;
  final int index;

  const DetalsProduct({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    final product = model.products[index];

    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // Product Name
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Price
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Brand
              Row(
                children: [
                  const Text(
                    'Brand: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product.brand),
                ],
              ),

              const SizedBox(height: 10),

              // Category
              Row(
                children: [
                  const Text(
                    'Category: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product.category),
                ],
              ),

              const SizedBox(height: 10),

              // Stock
              Row(
                children: [
                  const Text(
                    'Stock: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.inStock
                        ? '${product.stock} available'
                        : 'Out of stock',
                    style: TextStyle(
                      color: product.inStock ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Description
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(
                product.description,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),

              const SizedBox(height: 30),

              // Add To Cart Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: product.inStock
                      ? () {
                          // Add to cart
                        }
                      : null,
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
