import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_contract.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_view_model.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/widgets/dots_indecator_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget(
      {super.key, required this.viewModel, required this.images});
  final ProductDetailsViewModel viewModel;
  final List<String> images;
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
              itemCount: images.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: images[index],
                  height: viewModel.mediaQuery!.height / 2,
                  width: viewModel.mediaQuery!.width,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              }),
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          start: 0,
          top: viewModel.mediaQuery!.height * 0.02,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              )),
        ),
        BlocBuilder<ProductDetailsViewModel, ProductDetailsState>(
          builder: (context, state) {
            return DontsIndecatorWidget(
              dotNumber: images.length,
              currentDot: viewModel.currentPageIndex,
            );
          },
        ),
      ],
    );
  }
}
