import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/widgets/custom_appbar.dart';
import 'package:shoply_app/core/utils/widgets/custom_dilog_errore.dart';
import 'package:shoply_app/core/utils/widgets/custom_loding_dilog.dart';
import 'package:shoply_app/core/utils/widgets/custom_sucsess_dilog.dart';
import 'package:shoply_app/features/product_details/view/widget/product_detile_body.dart';
import 'package:shoply_app/features/product_details/view/widget/product_detile_bottome.dart';
import 'package:shoply_app/features/product_details/view/widget/product_detile_top.dart';
import 'package:shoply_app/features/product_details/view_model/cubit.dart';
import 'package:shoply_app/features/product_details/view_model/state.dart';
import 'package:shoply_app/model/products/response_products.dart';

class ProductDetileScreen extends StatelessWidget {
  const ProductDetileScreen({super.key, required this.responsProducts});
  final ResponseProducts responsProducts;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitProductDitle(),
      child: Scaffold(
        appBar: CustomAppBar(title: Text('products detile')),
        body: BlocListener<CubitProductDitle, ProductDetailsState>(
          listenWhen: (previous, current) {
            return current is! ProductDetailsChangeQuantityState;
          },

          listener: (BuildContext context, state) {
            if (state is ProductDetailsAddToCartLoadingState) {
              return CustomLodingDilog.customLodingDilog(context: context);
            } else if (state is ProductDetailsAddToCartErrorState) {
              Navigator.pop(context);
              return CustomDilogErrore.customDialogErorre(
                context: context,
                title: 'Add to Cart',
                description: state.errorMessage,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else if (state is ProductDetailsAddToCartSuccessState) {
              Navigator.pop(context);
              CustomSucsessDilog.showProSuccessDialog(
                context: context,
                title: 'Add to Cart',
                description: 'Add to cart successfuly.',
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductDetileTop(responsProducts: responsProducts),
                SizedBox(height: 10),
                ProductDetileBody(responseProducts: responsProducts),
                SizedBox(height: 10),

                ProductDetileBottome(responseProducts: responsProducts),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
