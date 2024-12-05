// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';

class BestSellerCardWidget extends StatelessWidget {
  final Product product;
  final Function function;

  const BestSellerCardWidget(
      {required this.product, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: product.id ?? 0,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  imageUrl: product.imgCover ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.imagePlaceholder),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.title ?? "",
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            "${product.price ?? 0} EGP",
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
