import 'package:flutter/material.dart';

class CustomRowTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CustomRowTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),

        const SizedBox(width: 5),

        GestureDetector(
          onTap: onTap,
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              decoration: TextDecoration.underline,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
