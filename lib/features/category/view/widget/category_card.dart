import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/custom_cached_image_network.dart';
import 'package:shoply_app/features/category/view_model/cupit_category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final cubit = context.read<CupitCategory>();
    return ListView.separated(
      itemCount: cubit.responsCategory.length,

      itemBuilder: (context, index) {
        final respnsData = cubit.responsCategory[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  AppRoutes.pushNamed(
                    AppPages.product,
                    args: {
                      'categoryId': respnsData.id,
                      'name': respnsData.name,
                      'context': context,
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      //image
                      CustomCachedImageNetwork(
                        width: 120,
                        fit: BoxFit.cover,
                        image: respnsData.image ?? '',
                      ),
                      SizedBox(width: 20),
                      //text name category
                      Text(
                        respnsData.name ?? '',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: theme.onSurface,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 22),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10);
      },
    );
  }
}
