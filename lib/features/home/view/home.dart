import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';

import 'package:shoply_app/core/utils/widgets/custom_refresh_indecator.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_buton.dart';
import 'package:shoply_app/features/home/view_model/cupit.dart';
import 'package:shoply_app/features/home/view_model/sate.dart';
import 'package:shoply_app/features/home/view/widget/home_categories.dart';
import 'package:shoply_app/features/home/view/widget/home_sales.dart';
import 'package:shoply_app/features/home/view/widget/home_trending_products.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHome(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            if (state is HomeLodingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeErorreState) {
              return Center(child: Text(state.errorState));
            }
            return CustomRefreshIndicator(
              onRefresh: () async {
                await cubit.refreshHome();
              },

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeSales(),

                    //categry and view all
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          CustomTextButton(text: 'category', onPressed: () {}),
                          Spacer(),
                          CustomTextButton(
                            text: 'viewAll',
                            onPressed: () {
                              AppRoutes.pushNamed(AppPages.category);
                            },
                          ),
                        ],
                      ),
                    ),

                    HomeCategories(),

                    //trending products and view all
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          CustomTextButton(
                            text: 'trending product',
                            onPressed: () {},
                          ),
                          Spacer(),
                          CustomTextButton(text: 'viewAll', onPressed: () {}),
                        ],
                      ),
                    ),

                    // trinding products
                    HomeTrendingProducts(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
