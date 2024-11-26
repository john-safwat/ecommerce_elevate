import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_contract.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_view_model.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/widgets/dots_indecator_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget(
      {super.key, required this.viewModel, required this.product});
  final ProductDetailsViewModel viewModel;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: viewModel.mediaQuery!.height / 2,
          child: PageView.builder(
              controller: viewModel.pageController,
              onPageChanged: (value) {
                viewModel.doIntent(ChangeCurrentPageIndexAction(value));
              },
              itemCount: product.images?.length ?? 0,
              itemBuilder: (context, index) {
                return Hero(
                  tag: product.id ?? 0,
                  child: CachedNetworkImage(
                    imageUrl: product.images?[index] ?? '',
                    height: viewModel.mediaQuery!.height / 2,
                    width: viewModel.mediaQuery!.width,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              }),
        ),
        BlocBuilder<ProductDetailsViewModel, ProductDetailsState>(
          builder: (context, state) {
            return DontsIndecatorWidget(
              dotNumber: product.images?.length ?? 0,
              currentDot: viewModel.currentPageIndex,
            );
          },
        ),
      ],
    );
  }
}
