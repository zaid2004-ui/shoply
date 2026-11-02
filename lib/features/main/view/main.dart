import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoply_app/features/main/view/widget/appbar.dart';
import 'package:shoply_app/features/main/view/widget/drawer.dart';
import 'package:shoply_app/features/main/view/widget/main_bottom_nav_bar.dart';
import 'package:shoply_app/features/main/view_model/cubit.dart';
import 'package:shoply_app/features/main/view_model/state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitMain()..getCartCount(),
      child: Scaffold(
        appBar: Appbar(),
        drawer: DreaweWidget(),
        body: BlocBuilder<CubitMain, MainState>(
          builder: (context, state) {
            final cubit = context.read<CubitMain>();
            return cubit.page[cubit.navBarIndex];
          },
        ),

        bottomNavigationBar: MainBottomNavBar(),
      ),
    );
  }
}
