import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_states.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/widgets/filter_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesTabsViewWidget extends StatefulWidget {
  const CategoriesTabsViewWidget({
    super.key,
    required this.viewModel,
    required this.productsList,
  });
  final CategoriesViewModel viewModel;
  final List<Product> productsList;

  @override
  State<CategoriesTabsViewWidget> createState() =>
      _CategoriesTabsViewWidgetState();
}

class _CategoriesTabsViewWidgetState extends State<CategoriesTabsViewWidget> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.doIntent(ScrollFilterAction());
  }

  @override
  dispose() {
    super.dispose();
    widget.viewModel.scrollController.dispose();
  }

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
                widget.viewModel.locale!.thereIsNoProduct,
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
        return Skeletonizer(
          enabled: widget.productsList.isEmpty,
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            controller: widget.viewModel.scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: widget.productsList.isEmpty
                ? 10
                : widget.productsList.length,
            itemBuilder: (context, index) {
              return SlideInUp(
                duration: Duration(milliseconds: 500 + (index * 50)),
                child: ProductCardWidget(
                  product: widget.productsList.isNotEmpty
                      ? widget.productsList[index]
                      : Product(
                          id: UniqueKey().toString(),
                          imgCover: "",
                          price: 123,
                          priceAfterDiscount: 32,
                          title: "ad"),
                  buttonTitle: widget.viewModel.locale!.addToCart,
                  buttonIcon: Icons.shopping_cart_outlined,
                  onPressed: () {
                    //------> add product to cart
                    widget.viewModel.doIntent(AddProductToCartActions(
                        widget.productsList[index]));
                  },
                  onCardPressed: () {
                    //--------> navigator to product details
                    widget.viewModel.doIntent(
                        NavigatorToProductDetailsActions(
                            widget.productsList[index]));
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
