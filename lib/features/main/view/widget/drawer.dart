import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_dialog/pro_dialog.dart';
import 'package:shoply_app/core/local/local_storage_user.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/theme/app_icons.dart';
import 'package:shoply_app/core/utils/widgets/custom_cached_image_network.dart';
import 'package:shoply_app/core/utils/widgets/custom_dialog.dart';
import 'package:shoply_app/core/utils/widgets/custom_listtile_drawer.dart';
import 'package:shoply_app/features/main/view_model/cubit.dart';

class DreaweWidget extends StatelessWidget {
  const DreaweWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CubitMain>();
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CustomCachedImageNetwork(
                    image: LocalStorageUser.instens.profileImage,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        LocalStorageUser.instens.name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        LocalStorageUser.instens.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            height: 2,
            thickness: 0.5,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          CustomListTileDrawer(
            iconData: Icons.shopping_bag_outlined,
            title: 'My Orders',
          ),
          SizedBox(height: 20),
          CustomListTileDrawer(
            iconData: Icons.settings_outlined,
            title: 'Settings',
          ),
          SizedBox(height: 20),
          CustomListTileDrawer(iconData: Icons.info_outline, title: 'About'),
          Spacer(),
          CustomListTileDrawer(
            title: 'logout',
            iconData: AppIcons.logout,
            onTap: () {
              CustomDialog.showCustomProDialog(
                context: context,
                title: 'logout',
                description: 'Are you sure you want to log out?',
                dialogType: DialogType.error,
                iconBackgroundColor: Theme.of(context).colorScheme.error,
                iconColor: Theme.of(context).colorScheme.onPrimary,
                icon: AppIcons.exitToApp,
                buttons: [
                  DialogButton(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  DialogButton(
                    text: 'Logout',
                    isPrimary: true,
                    onPressed: () {
                      AppRoutes.pushNamedAndRemoveUntil(
                        AppPages.login,
                        AppPages.register,
                      );
                      cubit.logout();
                    },
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
