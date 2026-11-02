import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/theme/app_icons.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/features/product_details/view_model/cubit.dart';
import 'package:shoply_app/features/product_details/view_model/state.dart';
import 'package:shoply_app/model/cart/cart.dart';
import 'package:shoply_app/model/products/response_products.dart';

class ProductDetileBottome extends StatelessWidget {
  const ProductDetileBottome({super.key, required this.responseProducts});
  final ResponseProducts responseProducts;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CubitProductDitle>();

    return Column(
      children: [
        Container(
          width: 190,
          height: 52,
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),

            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(AppIcons.remove),
                onPressed: () {
                  cubit.decrementQuantity();
                },
              ),
              VerticalDivider(color: Theme.of(context).colorScheme.primary),
              Center(
                child: BlocBuilder<CubitProductDitle, ProductDetailsState>(
                  buildWhen: (previous, current) {
                    return current is ProductDetailsChangeQuantityState;
                  },
                  builder: (BuildContext context, state) {
                    final cubit = context.read<CubitProductDitle>();
                    return Text(cubit.quantite.toString());
                  },
                ),
              ),

              VerticalDivider(color: Theme.of(context).colorScheme.primary),

              IconButton(
                icon: Icon(AppIcons.add),
                onPressed: () {
                  cubit.incrementQuantity();
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        CustomButton(
          text: 'add to cart',
          onPressed: () {
            cubit.addToCart(
              requestCart: Cart(
                id: responseProducts.id,
                name: responseProducts.name,
                price: responseProducts.price,
                images: responseProducts.images,
                quantity: cubit.quantite,
              ),
              context: context,
            );
          },
        ),
      ],
    );
  }
}
