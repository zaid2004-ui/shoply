import 'package:flutter/material.dart';
import 'package:shoply_app/model/model_product.dart';

class CardHome extends StatelessWidget {
  final int index;
  final ModelProduct model;
  final String image;
  final String name;
  final double price;
  final int isSingle;

  const CardHome({
    super.key,
    required this.index,
    required this.model,
    required this.image,
    required this.name,
    required this.price,
    required this.isSingle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: isSingle == 1
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          '\$$price',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),

                      const SizedBox(height: 4),

                      Text(
                        '\$$price',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
