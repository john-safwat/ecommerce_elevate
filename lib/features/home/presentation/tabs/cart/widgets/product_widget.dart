import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/cart_items.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/cart/view_model/cart_tab_events.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/cart/view_model/cart_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductWidget extends StatelessWidget {
  final int index;
  final CartItems item;

  const ProductWidget({required this.item, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<CartTabViewModel>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 120,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: item.product?.imgCover ?? "",
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(AppImages.imagePlaceholder),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              height: 104,
              width: 104,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product?.title ?? "",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          item.product?.description ?? "",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.gray),
                        ),
                      ],
                    )),
                    const SizedBox(width: 8),
                    InkWell(
                        onTap: () {
                          viewModel.doIntent(DeleteProductAction(
                              item.product?.id ?? "", index));
                        },
                        child: const Icon(
                          Icons.delete_outline,
                          color: AppColors.red,
                        ))
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "EGP ${(item.product?.price ?? 0)}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          viewModel.doIntent(UpdateProductQuantity(
                            ((item.quantity ?? 1) == 1)
                                ? 1
                                : item.quantity! - 1,
                            item.product?.id ?? "",
                          ));
                        },
                        child: const Icon(Icons.remove)),
                    const SizedBox(width: 8),
                    Text(
                      "${item.quantity}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                        onTap: () {
                          viewModel.doIntent(UpdateProductQuantity(
                            (item.quantity ?? 1) + 1,
                            item.product?.id ?? "",
                          ));
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
