import 'package:flutter/material.dart';

class CustomLodingDilog extends StatelessWidget {
  const CustomLodingDilog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static void customLodingDilog({required BuildContext context}) {
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
        SizedBox(height: 15),
        Text(
          'Please wait...',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
