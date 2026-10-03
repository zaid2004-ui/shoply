import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(onPressed: onPressed, icon: icon, iconSize: 40),
    );
  }
}
