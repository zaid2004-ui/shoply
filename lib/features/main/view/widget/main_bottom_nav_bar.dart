import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/main/view_model/cubit.dart';
import 'package:shoply_app/features/main/view_model/state.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitMain, MainState>(
      builder: (BuildContext context, state) {
        final cubit = context.read<CubitMain>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 1,
              thickness: 0.4,
              color: Theme.of(context).colorScheme.onSurface,
            ),

            NavigationBar(
              selectedIndex: cubit.navBarIndex,
              onDestinationSelected: (index) {
                cubit.changeNavBarIndex(index: index);
              },
              indicatorShape: CircleBorder(),
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),

                NavigationDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),

                NavigationDestination(
                  icon: Badge(
                    padding: EdgeInsets.all(1),
                    offset: Offset(4, -8),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Center(
                      child: Text(
                        '11',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                  selectedIcon: Badge(
                    padding: EdgeInsets.all(1),
                    offset: Offset(6, -10),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Center(
                      child: Text(
                        '55',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Icon(Icons.shopping_bag),
                  ),
                  label: 'Cart',
                ),

                NavigationDestination(
                  icon: Icon(Icons.person_2_outlined),
                  selectedIcon: Icon(Icons.person_2),
                  label: 'Profile',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
