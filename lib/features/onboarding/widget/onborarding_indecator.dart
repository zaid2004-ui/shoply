import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnborardingIndecator extends StatelessWidget {
  const OnborardingIndecator({super.key, this.index});
  final int? index;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      axisDirection: Axis.horizontal,
      activeIndex: index ?? 0,
      count: 2,
      effect: ExpandingDotsEffect(
        spacing: 8,
        radius: 50,
        dotWidth: 10,
        dotHeight: 10,
        activeDotColor: Theme.of(context).colorScheme.primary,
        dotColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
