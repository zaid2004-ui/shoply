import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';

class HomeSales extends StatelessWidget {
  const HomeSales({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      //new colocation
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned(
            bottom: 50,
            right: 1,
            top: 1,
            child: Image.asset(
              AppImages.shoplySplashImage,
              width: 200,
              height: 200,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),

                Text(
                  'New Collection',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Discover the latest trends',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Shop Now',
                  onPressed: () {},
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
