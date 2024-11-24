import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
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
        ProductDetailsImageWidget(
          viewModel: viewModel,
          images: const [
            "https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png",
            "https://flower.elevateegy.com/uploads/75fae675-a16e-4d26-98a4-63f34e8423f0-image_three.png",
            "https://flower.elevateegy.com/uploads/7f3bcf05-7e55-476c-9d3d-8026c709a80c-image_two.png"
          ],
        ),
        ProductDetailsAndDescription(
          viewModel: viewModel,
          product: Product(
            productId: '1',
            title: "GABRIELLE CHANEL",
            slug: "slug",
            description:
                "PRODUCT\nBefore creating the House of CHANEL, Coco was Gabrielle. A rebel ",
            imgCover: "imgCover",
            images: ["images"],
            price: 340,
            priceAfterDiscount: 172,
            quantity: 1000,
            category: "category",
            occasion: "occasion",
            createdAt: "createdAt",
            updatedAt: "updatedAt",
            V: 1,
          ),
        )
      ])),
    );
  }

  @override
  ProductDetailsViewModel initViewModel() {
    return getIt<ProductDetailsViewModel>();
  }
}
