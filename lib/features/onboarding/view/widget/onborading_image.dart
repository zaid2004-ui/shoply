import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';

class OnboradingImage extends StatelessWidget {
  const OnboradingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // primary container
        Container(
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        //contaner right
        Positioned(
          top: 250,
          left: 20,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(30),
              shape: BoxShape.circle,
            ),
          ),
        ),
        //contaner left
        Positioned(
          top: 30,
          right: 20,
          child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(30),
              shape: BoxShape.circle,
            ),
          ),
        ),
        // contaner and image
        Positioned(
          top: 90,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImages.onboardImage1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
