import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/custom_onboarding_button.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class OnborardingActions extends StatelessWidget {
  const OnborardingActions({super.key, this.index, this.controller});
  final int? index;
  final CarouselSliderController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CustomOnboardingButton(
            text: AppLocalizations.of(context)!.next,
            onPressed: () {
              log('Current index: $index');
              final int nextIndex = index ?? 0;
              if (nextIndex < 1) {
                controller?.nextPage(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeInOutCubic,
                );
              } else {
                AppRoutes.pushNamed(AppPages.login);
              }
            },
          ),

          Spacer(),
          CustomOnboardingButton(
            text: AppLocalizations.of(context)!.skip,
            onPressed: () {
              AppRoutes.pushNamed(AppPages.login);
            },
          ),
        ],
      ),
    );
  }
}
