import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/l10n/app_localizations.dart';

class ActionButon extends StatelessWidget {
  const ActionButon({
    super.key,
    required this.onRegister,
    required this.onGoogleRegister,
  });
  final VoidCallback onRegister;
  final VoidCallback onGoogleRegister;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: localizations.registration,
            onPressed: onRegister,
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: CustomButton(text: 'Google', onPressed: onGoogleRegister),
        ),
      ],
    );
  }
}
