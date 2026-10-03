import 'dart:developer';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/features/onboarding/widget/onborarding_actions.dart';
import 'package:shoply_app/features/onboarding/widget/onborarding_indecator.dart';

class Welcom extends StatelessWidget {
  const Welcom({
    super.key,
    this.index,
    this.controller,
    this.subTitle,
    this.title,
  });
  final int? index;
  final CarouselSliderController? controller;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    log(index.toString());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(30),
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimary.withAlpha(30),
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
          ),

          SizedBox(height: 10),
          //list tile and sub tiel
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              //title
              title: Text(
                title ?? "null",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                ),
              ),

              //sub title
              subtitle: Padding(
                padding: const EdgeInsetsGeometry.fromLTRB(0, 15, 0, 0),
                child: Text(
                  subTitle ?? "null",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),

          //animatedSmoothIndicator
          Center(child: OnborardingIndecator(index: index)),
          SizedBox(height: 150),
          //buton next and skip
          OnborardingActions(index: index, controller: controller),
        ],
      ),
    );
  }
}
