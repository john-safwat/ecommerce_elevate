import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_view_model.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/widgets/product_details_and_description.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/widgets/product_details_image_widget.dart';
import 'package:flutter/material.dart';
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
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
          body: ListView(children: [
        ProductDetailsImageWidget(viewModel: viewModel),
        ProductDetailsAndDescription(viewModel: viewModel)
      ])),
    );
  }

  @override
  ProductDetailsViewModel initViewModel() {
    return getIt<ProductDetailsViewModel>();
  }
}
