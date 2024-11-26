
// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';

import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final IconData buttonIcon;
  final String buttonTitle;
  final Function onPressed;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.onPressed,
    required this.buttonIcon,
    required this.buttonTitle,
  });

  int discount(int price, int priceAfterDisc) {
    return ((price - priceAfterDisc) / price * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .28,
      width: width * .4,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white[AppColors.colorCode70]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.imgCover ?? AppImages.test,
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error, color: AppColors.pink)),
              fit: BoxFit.cover,
              width: double.infinity,

            ),
          ),
          const SizedBox(height: 8),
          Column(
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
                        Text(
                          '${discount(product.price ?? 0, product.priceAfterDiscount ?? 0)}%',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.successGreen,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  onPressed();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      buttonIcon,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      buttonTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
