import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final Color color;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        trailing: IconButton(onPressed: onTap, icon: icon),
      ),
    );
  }
}
