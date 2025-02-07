// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/product_details/presentation/product_details_view_model.dart';
import 'package:ecommerce_elevate/features/product_details/presentation/widgets/product_details_and_description.dart';
import 'package:ecommerce_elevate/features/product_details/presentation/widgets/product_details_image_widget.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState
    extends BaseState<ProductDetailsView, ProductDetailsViewModel> {
  @override
  Widget build(BuildContext context) {
    viewModel.product = ModalRoute.of(context)!.settings.arguments as Product;
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
          body: Stack(
        children: [
          ListView(padding: EdgeInsets.zero, children: [
            ProductDetailsImageWidget(
              viewModel: viewModel,
              product: viewModel.product,
            ),
            ProductDetailsAndDescription(
              viewModel: viewModel,
              product: viewModel.product,
            )
          ]),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
        ],
      )),
    );
  }

  @override
  ProductDetailsViewModel initViewModel() {
    return getIt<ProductDetailsViewModel>();
  }
}
