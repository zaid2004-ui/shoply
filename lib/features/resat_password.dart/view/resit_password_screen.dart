import 'package:flutter/material.dart';
import 'package:shoply_app/features/resat_password.dart/view/widget/resat_password_card.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            // =========================
            // Background circle - bottom left
            // =========================
            Positioned(
              top: 500,
              left: -150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withAlpha(30),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // =========================
            // Background circle - top right
            // =========================
            Positioned(
              top: 50,
              right: -150,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withAlpha(30),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // =========================
            // Reset Password Card
            // =========================
            Center(child: ResetPasswordCard(emailControler: emailControler)),

            // =========================
            // Logo
            // =========================
            // Positioned(
            //   top: 200,
            //   left: 0,
            //   right: 0,
            //   child: Center(
            //     child: Image.asset(
            //       AppImages.shoplySplashImage,
            //       width: 100,
            //       height: 100,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
