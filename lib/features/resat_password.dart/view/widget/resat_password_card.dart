import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoply_app/core/regex/app_regex.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_row_title_subtitle.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_field.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class ResetPasswordCard extends StatelessWidget {
  const ResetPasswordCard({
    super.key,
    required this.emailControler,
    required this.onRest,
  });

  final TextEditingController emailControler;
  final VoidCallback onRest;

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
            padding: const EdgeInsets.fromLTRB(30, 35, 30, 30),
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
                // =========================
                // Reset Password Title
                // =========================
                Text(
                  localizations.reset_password,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.greatVibes(
                    fontSize: 48,
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 25),

                // =========================
                // Description
                // =========================
                Text(
                  localizations.forgot,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(height: 30),

                // =========================
                // Email
                // =========================
                CustomTextField(
                  inputType: TextInputType.emailAddress,

                  label: localizations.emile,
                  controller: emailControler,
                  valedator: (v) => AppRegex.email.hasMatch(v?.trim() ?? '')
                      ? null
                      : 'Enter a valid email',
                ),

                const SizedBox(height: 25),

                // =========================
                // Reset Password Button
                // =========================
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: localizations.reset_password,
                    onPressed: () {
                      onRest();
                    },
                  ),
                ),

                const SizedBox(height: 18),

                // =========================
                // Back To Login
                // =========================
                CustomRowTitleSubtitle(
                  title: localizations.daccount,
                  subtitle: localizations.login,
                  onTap: () {
                    AppRoutes.pushNamedAndRemoveUntil(
                      AppPages.login,
                      AppPages.login,
                    );
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
