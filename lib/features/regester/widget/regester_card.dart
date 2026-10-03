import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_password_field.dart';
import 'package:shoply_app/core/utils/widgets/custom_row_title_subtitle.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_field.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onRegister,
    required this.onGoogleRegister,
    required this.onLogin,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final VoidCallback onRegister;
  final VoidCallback onGoogleRegister;
  final VoidCallback onLogin;

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
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
                Text(
                  localizations.registration,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.greatVibes(
                    fontSize: 48,
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 30),

                CustomTextField(
                  label: localizations.name,
                  controller: nameController,
                ),

                const SizedBox(height: 15),

                CustomTextField(
                  label: localizations.emile,
                  controller: emailController,
                ),

                const SizedBox(height: 15),

                // Phone field
                // ضع هنا CustomPhoneField الخاص بك
                // مع phoneController
                const SizedBox(height: 15),

                CustomPasswordField(
                  label: localizations.password,
                  controller: passwordController,
                ),

                const SizedBox(height: 15),

                CustomPasswordField(
                  label: localizations.confirm,
                  controller: confirmPasswordController,
                ),

                const SizedBox(height: 25),

                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: localizations.registration,
                        onPressed: onRegister,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: CustomButton(
                        text: 'Google',
                        onPressed: onGoogleRegister,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                CustomRowTitleSubtitle(
                  title: localizations.daccount,
                  subtitle: localizations.login,
                  onTap: onLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
