import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsAndDescription extends StatelessWidget {
  const ProductDetailsAndDescription(
      {super.key, required this.viewModel, required this.product});
  final ProductDetailsViewModel viewModel;
  final Product product;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(viewModel.mediaQuery!.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //---> price and status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${viewModel.locale!.egp} ${product.price}',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Text(
                    '${viewModel.locale!.status}: ',
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${product.V}',
                    style: theme.textTheme.titleSmall!
                        .copyWith(fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('All prices include tax',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 13, color: AppColors.gray)),
          const SizedBox(height: 8),
          Text('15 Pink Rose Bouquet',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 24),
          Text(viewModel.locale!.description,
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500)),
          Text(product.description ?? '',
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black)),
          const SizedBox(height: 24),
          Text('Bouquet include',
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text('Pink roses:15',
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black)),
          Text('White wrap',
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black)),
          const SizedBox(height: 24),
          //-----> add to cart button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: AppColors.pink,
              ),
              child: Text(viewModel.locale!.addToCart),
            ),
          ),
        ],
      ),
    );
  }
}
