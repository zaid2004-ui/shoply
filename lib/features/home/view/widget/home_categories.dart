import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/routes/app_routes.dart';
import 'package:shoply_app/core/utils/widgets/custom_cached_image_network.dart';
import 'package:shoply_app/features/home/view_model/cupit.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: ((context, index) {
          final categoryData = cubit.responseCategory[index];
          return Column(
            children: [
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  AppRoutes.pushNamed(AppPages.category);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: CustomCachedImageNetwork(
                    fit: BoxFit.cover,
                    width: 120,
                    image: categoryData.image ?? '',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                categoryData.name ?? '',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          );
        }),
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        itemCount: cubit.responseCategory.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
