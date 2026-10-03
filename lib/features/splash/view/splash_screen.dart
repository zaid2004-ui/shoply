import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _fadeanimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, AppPages.onBoardingScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: FadeTransition(
        opacity: _fadeanimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.shoplySplashImage, width: 200, height: 200),
              Text(
                AppLocalizations.of(context)!.welcome,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shoply_app/core/routes/app_pages.dart';
// import 'package:shoply_app/core/utils/images/app_images.dart';
// import 'package:shoply_app/features/splash/view_model/cubit.dart';
// import 'package:shoply_app/features/splash/view_model/state.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SplashCubit()..goNextPage(),
//       child: Scaffold(
//         body: BlocListener<SplashCubit, SplashState>(
//           listener: (context, state) {
//             if (state is SplashOnBoardPageState) {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 AppPages.onBoardingScreen,
//                 (route) => false,
//               );
//             }
//           },
//           child: Center(
//             child: Image(
//               // image: AssetImage(AppImages.shoplySplashImage),
//               height: 350,
//               width: 350,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
