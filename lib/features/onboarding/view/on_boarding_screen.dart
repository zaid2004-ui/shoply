import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/onboarding/cubit/cubet_onbording.dart';
import 'package:shoply_app/features/onboarding/cubit/onboarding_state.dart';
import 'package:shoply_app/features/onboarding/widget/welcom.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  CarouselSliderController courserCnotroler = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    // 1. قم بوضع BlocProvider هنا لتغليف الصفحة بالكامل
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return CarouselSlider(
              carouselController: courserCnotroler,
              options: CarouselOptions(
                height: double.infinity,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  context.read<OnboardingCubit>().changePage(index);
                  log('Current index: $index');
                },
              ),
              items: [
                Welcom(
                  index: state.count,
                  controller: courserCnotroler,
                  title: AppLocalizations.of(context)!.beautyBeginsWithAFlower,
                  subTitle: AppLocalizations.of(context)!.discoverBouquets,
                ),
                Welcom(
                  index: state.count,
                  controller: courserCnotroler,
                  title: AppLocalizations.of(context)!.sameDayDelivery,
                  subTitle: AppLocalizations.of(
                    context,
                  )!.sameDayDeliverySubtitle,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
