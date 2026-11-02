import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/widgets/custom_cached_image_network.dart';
import 'package:shoply_app/core/utils/widgets/custom_smooth_indicator.dart';
import 'package:shoply_app/features/product_details/view_model/cubit.dart';
import 'package:shoply_app/model/products/response_products.dart';

class ProductDetileTop extends StatelessWidget {
  const ProductDetileTop({super.key, required this.responsProducts});
  final ResponseProducts responsProducts;

  @override
  Widget build(BuildContext context) {
    log(responsProducts.images.length.toString());

    final cubit = context.read<CubitProductDitle>();
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: cubit.controller,
            itemBuilder: (context, index) {
              return CustomCachedImageNetwork(
                image: responsProducts.images[index],
              );
            },
            itemCount: responsProducts.images.length,
          ),
        ),
        SizedBox(height: 20),

        CustomSmoothIndicator(
          pageController: cubit.controller,
          count: responsProducts.images.length,
        ),
      ],
    );
  }
}
