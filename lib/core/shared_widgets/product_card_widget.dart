import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final int priceAfterDiscount;
  final int price;
  final Function onPressed;

  const ProductCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.priceAfterDiscount,
    required this.price,
    required this.onPressed,
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
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white[AppColors.colorCode70]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 56,
            child: Image.asset(AppImages.test, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 38,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EGP $priceAfterDiscount',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.gray,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          Text(
                            '${discount(price, priceAfterDiscount)}%',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
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
                const Spacer(),
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
                      SizedBox(width: width * .04),
                      Text(
                        AppLocalizations.of(context)!.addToCart,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
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
          ),
        ],
      ),
    );
  }
}
