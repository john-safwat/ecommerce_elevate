import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OccasionsTabviewWidget extends StatelessWidget {
  final OccasionsViewModel viewModel;

  const OccasionsTabviewWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionsViewModel, OccasionsStates>(
      bloc: viewModel,
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
        switch (state) {
          case OccasionInitialsState():
          case OccasionLoadingState():
          case OccasionTabsSuccessState():
          case OccasionProductsSuccessState():
          case NavigatorToProductDetailsState():
          case ProductsLoadingState():
          case OccasionFailureState():
            {
              return Skeletonizer(
                enabled: viewModel.products.isEmpty,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: viewModel.products.isEmpty
                      ? 10
                      : viewModel.products.length,
                  itemBuilder: (context, index) {
                    return ProductCardWidget(
                      product: viewModel.products.isNotEmpty
                          ? viewModel.products[index]
                          : Product(
                              id: UniqueKey().toString(),
                              imgCover: "",
                              price: 123,
                              priceAfterDiscount: 32,
                              title: "ad"),
                      buttonTitle: viewModel.locale!.addToCart,
                      buttonIcon: Icons.shopping_cart_outlined,
                      onPressed: () {},
                      onCardPressed: () {
                        viewModel.doIntent(
                          NavigatorToProductDetails(
                              product: viewModel.products[index]),
                        );
                      },
                    );
                  },
                ),
              );
            }
          case ProductsFailureState():
            {
              return Center(child: Text(state.errorMessage));
            }
          case EmptyProductsState():
            {
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
        }
      },
    );
  }
}
