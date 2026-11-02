import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/custom_cached_image_network.dart';
import 'package:shoply_app/features/products/view_model/cubit.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CubitProducts>();
    final theme = Theme.of(context).colorScheme;
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12),
      itemCount: cubit.responsProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 230,
        crossAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        final productDate = cubit.responsProducts[index];

        return GestureDetector(
          onTap: () {
            AppRoutes.pushNamed(
              AppPages.productDetileScreen,
              args: {'responseProducts': productDate, 'context': context},
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: theme.surface,
                ),
                child: CustomCachedImageNetwork(
                  fit: BoxFit.cover,
                  image: cubit.responsProducts[index].images[0],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  cubit.responsProducts[index].name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: theme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '\$ ${cubit.responsProducts[index].price}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
