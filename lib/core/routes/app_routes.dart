import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/features/home/view/detals_product.dart';
import 'package:shoply_app/features/home/view/home.dart';
import 'package:shoply_app/features/login/view/login.dart';
import 'package:shoply_app/features/onboarding/view/on_boarding_screen.dart';
import 'package:shoply_app/features/signup/view/signup_screen.dart';
import 'package:shoply_app/features/resat_password.dart/view/resit_password_screen.dart';
import 'package:shoply_app/features/splash/view/splash_screen.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );

      case AppPages.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoardingScreen();
          },
        );
      case AppPages.login:
        return MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        );
      case AppPages.resetPassword:
        return MaterialPageRoute(
          builder: (context) {
            return ResetPassword();
          },
        );
      case AppPages.register:
        return MaterialPageRoute(
          builder: (context) {
            return const SignupScreen();
          },
        );
      case AppPages.home:
        return MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        );
      case AppPages.detals:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (context) {
            return DetalsProduct(model: args['model'], index: args['index']);
          },
        );

      default:
        return null;
    }
  }

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    String untilRoute, {
    dynamic args,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(untilRoute),
      arguments: args,
    );
  }

  static void back() {
    navigatorKey.currentState!.pop();
  }

  static void backToRoot() {
    navigatorKey.currentState!.popUntil(
      (Route<dynamic> route) => route.isFirst,
    );
  }

  static Future<dynamic> startNewRoute(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }
}
