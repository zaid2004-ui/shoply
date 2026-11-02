import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/theme/app_icons.dart';
import 'package:shoply_app/core/utils/widgets/custom_appbar.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indecator.dart';
import 'package:shoply_app/features/category/view/widget/category_card.dart';
import 'package:shoply_app/features/category/view_model/cupit_category.dart';
import 'package:shoply_app/features/category/view_model/state.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CupitCategory()..getCategroy(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('Category'),
          leading: IconButton(
            onPressed: () {
              AppRoutes.back();
            },
            icon: Icon(AppIcons.back),
          ),
        ),

        body: BlocBuilder<CupitCategory, CtegoryState>(
          builder: (BuildContext context, state) {
            final cubit = context.read<CupitCategory>();
            if (state is LodingCategoryState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ErroreCategoryState) {
              return Center(child: Text(state.errorMesage));
            }
            return CustomRefreshIndicator(
              child: CategoryCard(),
              onRefresh: () async {
                await cubit.refreshCategory();
              },
            );
          },
        ),
      ),
    );
  }
}
