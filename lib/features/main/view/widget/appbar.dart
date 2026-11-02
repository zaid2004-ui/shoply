import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/theme/app_icons.dart';
import 'package:shoply_app/core/utils/widgets/custom_appbar.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Shop'),
          Text(
            'ly',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 25,
            ),
          ),
        ],
      ),
      titleText: 'ly',
      leading: IconButton(
        icon: Icon(AppIcons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(icon: Icon(AppIcons.notification), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
