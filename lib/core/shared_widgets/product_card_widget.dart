// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  // should be object of type product and onPress function
  final Product product;
  final String buttonTitle;
  final Function onPressed;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.onPressed,
    required this.buttonTitle,
  });

  int discount(int price, int priceAfterDisc) {
    return ((price - priceAfterDisc) / price * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    // container boundaries should depend on the parent widget
    return Container(
      padding: const EdgeInsets.all(8),
      // no need for the margin the space is described by the parent
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white[AppColors.colorCode70]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // no need for expanded just add the image and it's width will fill
          // automatically and take the image aspect ratio
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.imgCover ?? AppImages.imagePlaceholder,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title ?? "",
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'EGP ${product.priceAfterDiscount ?? 0} ',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    " ${product.price ?? 0}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.gray,
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                  Text(
                    ' ${discount(product.price ?? 0, product.priceAfterDiscount ?? 0)}%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.successGreen,
                        ),
                  ),
                ],
              )
            ],
          ),
          // wrong use of spacer
          // const Spacer(),
          ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 18,
                ),
                // only 8 is needed
                const SizedBox(width: 8),
                // pass button title
                Text(
                  buttonTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 13, color: AppColors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
