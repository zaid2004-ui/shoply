import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/custom_onboarding_button.dart';
import 'package:shoply_app/features/onboarding/view_model/cubet_onbording.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class OnborardingActions extends StatelessWidget {
  const OnborardingActions({super.key, this.index, this.controller});
  final int? index;
  final CarouselSliderController? controller;

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomOnboardingButton(
          onPressed: () {
            context.read<OnboardingCubit>().setShowOnboarding();
            AppRoutes.pushNamed(AppPages.login);
          },
          text: AppLocalizations.of(context)!.skip,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: CustomOnboardingButton(
          onPressed: () {
            controller!.nextPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOutCubic,
            );
          },
          text: AppLocalizations.of(context)!.next,
        ),
      );
    }
  }
}
