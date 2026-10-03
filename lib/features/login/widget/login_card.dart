import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_password_field.dart';
import 'package:shoply_app/core/utils/widgets/custom_row_title_subtitle.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_field.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.emailControler,
    required this.passwordController,
  });

  final TextEditingController emailControler;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final localizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(30, 25, 30, 30),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 25,
                  spreadRadius: 2,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset(
                  AppImages.shoplySplashImage,
                  width: 160,
                  height: 160,
                ),

                const SizedBox(height: 5),

                // Login title
                Text(
                  localizations.login,
                  style: GoogleFonts.greatVibes(
                    fontSize: 48,
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 30),

                // Email
                CustomTextField(
                  label: localizations.emile,
                  controller: emailControler,
                ),

                const SizedBox(height: 18),

                // Password
                CustomPasswordField(
                  label: localizations.password,
                  controller: passwordController,
                ),

                const SizedBox(height: 10),

                // Forgot password
                CustomRowTitleSubtitle(
                  title: localizations.forgot,
                  subtitle: localizations.reset_password,
                  onTap: () {
                    AppRoutes.pushNamed(AppPages.resetPassword);
                  },
                ),

                const SizedBox(height: 25),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: localizations.login,
                    onPressed: () {
                      AppRoutes.pushNamed(AppPages.home);
                    },
                  ),
                ),

                const SizedBox(height: 18),

                // Register
                CustomRowTitleSubtitle(
                  title: localizations.daccount,
                  subtitle: localizations.registration,
                  onTap: () {
                    AppRoutes.pushNamed(AppPages.register);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
