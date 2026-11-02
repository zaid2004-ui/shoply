import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/features/category/view/category.dart';
import 'package:shoply_app/features/home/view/home.dart';
import 'package:shoply_app/features/login/view/login.dart';
import 'package:shoply_app/features/main/view/main.dart';
import 'package:shoply_app/features/onboarding/view/on_boarding_screen.dart';
import 'package:shoply_app/features/product_details/view/product_detile_screen.dart';
import 'package:shoply_app/features/products/view/product.dart';
import 'package:shoply_app/features/signup/view/signup_screen.dart';
import 'package:shoply_app/features/resat_password.dart/view/resit_password_screen.dart';
import 'package:shoply_app/features/splash/view/splash_screen.dart';
import 'package:shoply_app/model/products/response_products.dart';

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
      case AppPages.category:
        return MaterialPageRoute(
          builder: (context) {
            return const Category();
          },
        );
      case AppPages.mainScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const MainScreen();
          },
        );

      case AppPages.productDetileScreen:
        return MaterialPageRoute(
          builder: (_) {
            final arguments = settings.arguments as Map<String, dynamic>;

            // استخراج بيانات المنتج
            final responseProducts =
                arguments['responseProducts'] as ResponseProducts;

            // استخراج context الصفحة السابقة
            return ProductDetileScreen(responsProducts: responseProducts);
          },
        );

      case AppPages.product:
        return MaterialPageRoute(
          builder: (_) {
            final arrgument = settings.arguments as Map<String, dynamic>;

            return Product(
              categoryId: arrgument['categoryId'] as String,
              nameCategory: arrgument['name'] as String,
            );
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
