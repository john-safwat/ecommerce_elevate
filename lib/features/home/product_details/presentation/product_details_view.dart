import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState
    extends BaseState<ProductDetailsView, ProductDetailsViewModel> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  ProductDetailsViewModel initViewModel() {
    return getIt<ProductDetailsViewModel>();
  }
}
