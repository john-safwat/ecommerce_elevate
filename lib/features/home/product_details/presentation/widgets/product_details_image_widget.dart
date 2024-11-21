import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_contract.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_view_model.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/widgets/dots_indecator_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget({super.key, required this.viewModel});
  final ProductDetailsViewModel viewModel;
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
              itemCount: 6,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl:
                      'https://pixlr.com/images/generator/image-editor.webp',
                  height: viewModel.mediaQuery!.height / 2,
                  width: viewModel.mediaQuery!.width,
                  fit: BoxFit.cover,
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
              dotNumber: 6,
              currentDot: viewModel.currentPageIndex,
            );
          },
        ),
      ],
    );
  }
}
