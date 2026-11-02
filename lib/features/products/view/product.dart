import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/widgets/custom_appbar.dart';
import 'package:shoply_app/core/utils/widgets/custom_refresh_indecator.dart';
import 'package:shoply_app/features/products/view/widget/grid_card.dart';
import 'package:shoply_app/features/products/view_model/cubit.dart';
import 'package:shoply_app/features/products/view_model/state.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.categoryId,
    required this.nameCategory,
  });
  final String categoryId;
  final String nameCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          CubitProducts()..getProducts(categoryId: categoryId),

      child: BlocBuilder<CubitProducts, ProductsState>(
        builder: (BuildContext context, ProductsState state) {
          final cubit = context.read<CubitProducts>();
          if (state is LodingStateProducts) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErorregStateProducts) {
            return Center(child: Text(state.errorMessage));
          }
          return CustomRefreshIndicator(
            child: Scaffold(
              appBar: CustomAppBar(title: Text(nameCategory)),
              body: GridCard(),
            ),
            onRefresh: () async {
              await cubit.refreshProducts(categoryId);
            },
          );
        },
      ),
    );
  }
}
