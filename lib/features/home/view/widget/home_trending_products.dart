import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/widgets/custom_cached_image_network.dart';
import 'package:shoply_app/features/home/view_model/cupit.dart';

class HomeTrendingProducts extends StatelessWidget {
  const HomeTrendingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cubit.responseProducts.length,

      padding: EdgeInsets.symmetric(horizontal: 12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.9,
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        final productsData = cubit.responseProducts[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //contaner item
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200,
              ),
              child: CustomCachedImageNetwork(
                fit: BoxFit.fill,
                image: productsData.images.isNotEmpty
                    ? productsData.images[0]
                    : '',
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                productsData.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '\$ ${productsData.price}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
