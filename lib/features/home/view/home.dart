import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/JSON/product_json.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/features/home/cubit/cubie.dart';
import 'package:shoply_app/features/home/cubit/state_cubit.dart';
import 'package:shoply_app/features/home/widget/card_home.dart';
import 'package:shoply_app/model/model_product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ModelProduct model = ModelProduct.fromJson(data);
    return BlocProvider(
      create: (BuildContext context) => GridCubit(),
      child: BlocBuilder<GridCubit, GridState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  icon: Icon(
                    state.count == 1 ? Icons.grid_view : Icons.view_list,
                  ),
                  onPressed: () {
                    context.read<GridCubit>().changeGrid();
                    // Handle cart button press
                  },
                ),
              ],
            ),
            body: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: model.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: state.count,
                childAspectRatio: state.count == 1 ? 3.5 : 0.75,
              ),
              itemBuilder: (context, index) {
                // Create a CardHome widget for each product
                return InkWell(
                  onTap: () {
                    AppRoutes.pushNamed(
                      AppPages.detals,
                      args: {'model': model, 'index': index},
                    );
                  },
                  child: CardHome(
                    index: index,
                    model: model,
                    image: model.products[index].image,
                    name: model.products[index].name,
                    isSingle: state.count,
                    price: model.products[index].price,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
