import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImageNetwork extends StatelessWidget {
  const CustomCachedImageNetwork({
    super.key,
    required this.image,
    this.errorWidget,
    this.width,
    this.heights,
    this.fit,
  });

  final String image;
  final ErrorWidget? errorWidget;
  final double? width;
  final double? heights;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width ?? 150,
      height: heights ?? 150,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ?? Icon(Icons.error_outline, size: 28, color: Colors.red),
    );
  }
}
