import 'dart:developer';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import 'package:shoply_app/features/onboarding/view/widget/onborarding_indecator.dart';

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
          SizedBox(height: 30),
          //buton next and skip
        ],
      ),
    );
  }
}
