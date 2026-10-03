import 'package:flutter/material.dart';

class CustomOnboardingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOnboardingButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.onPrimary.withValues(alpha: 0.8),
      ),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
