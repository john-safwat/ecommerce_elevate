import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/features/home/best_seller/presentation/view_model/best_seller_states.dart';
import 'package:ecommerce_elevate/features/home/best_seller/presentation/view_model/best_seller_view_model.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerView extends StatefulWidget {
  const BestSellerView({super.key});

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState
    extends BaseState<BestSellerView, BestSellerViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        //----> appBar of view
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(viewModel.locale!.best_seller),
              Text(
                viewModel.locale!.bloom_with_our_exquisite_best_sellers,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 13, color: AppColors.gray),
              ),
            ],
          ),
        ),
        body: GridView.builder(
          padding:
              const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
            childAspectRatio: 163 / 229,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return BlocListener<BestSellerViewModel, BestSellerStates>(
              listener: (context, state) {},
              child: InkWell(
                onTap: () {
                  // todo : navigate to product details
                  // viewModel.doIntent(NavigatorToProductDetails());
                },
                child: ProductCardWidget(
                  product: Product(
                    id: '1',
                    title: 'title',
                    slug: 'slug',
                    description: 'description',
                    imgCover:
                        'https://cdn.pixabay.com/photo/2014/06/03/19/38/test-361512_640.jpg',
                    images: const [],
                    price: 220,
                    priceAfterDiscount: 200,
                    quantity: 100,
                    category: 'category',
                    occasion: 'occasion',
                  ),
                  onPressed: () {},
                  buttonIcon: Icons.add,
                  buttonTitle: viewModel.locale!.addToCart,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  BestSellerViewModel initViewModel() {
    return getIt<BestSellerViewModel>();
  }
}
