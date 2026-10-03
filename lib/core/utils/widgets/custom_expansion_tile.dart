import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Theme.of(context).colorScheme.surface,
      collapsedBackgroundColor: Theme.of(
        context,
      ).colorScheme.surface.withValues(alpha: 0.2),
      tilePadding: const EdgeInsets.all(10),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
