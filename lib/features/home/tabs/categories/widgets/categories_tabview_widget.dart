import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_states.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesTabsViewWidget extends StatelessWidget {
  const CategoriesTabsViewWidget({
    super.key,
    required this.viewModel,
    required this.productsList,
  });

  final CategoriesViewModel viewModel;
  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesViewModel, CategoriesStates>(
      listener: (context, state) {
        if (state is NavigatorToProductDetailsState) {
          Navigator.pushNamed(
            context,
            Routes.productDetailsRoute,
            arguments: state.product,
          );
        }
      },
      builder: (context, state) {
        if (state is GetAllProductsEmptyListState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AnimationsAssets.emptyAnimation),
              Text(
                viewModel.locale!.thereIsNoProduct,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          );
        }
        if (state is GetAllProductsFaliuerState) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Skeletonizer(
            enabled: productsList.isEmpty,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: productsList.isEmpty ? 10 : productsList.length,
              itemBuilder: (context, index) {
                return SlideInUp(
                  duration: Duration(milliseconds: 500 + (index * 50)),
                  child: ProductCardWidget(
                    product: productsList.isNotEmpty
                        ? productsList[index]
                        : Product(
                            id: UniqueKey().toString(),
                            imgCover: "",
                            price: 123,
                            priceAfterDiscount: 32,
                            title: "ad"),
                    buttonTitle: viewModel.locale!.addToCart,
                    buttonIcon: Icons.shopping_cart_outlined,
                    onPressed: () {
                      //------> add product to cart
                      viewModel.doIntent(
                          AddProductToCartActions(productsList[index]));
                    },
                    onCardPressed: () {
                      //--------> navigator to product details
                      viewModel.doIntent(NavigatorToProductDetailsActions(
                          productsList[index]));
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
