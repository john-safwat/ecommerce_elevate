// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/view_model/best_seller_action.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/view_model/best_seller_states.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/view_model/best_seller_view_model.dart';

class BestSellerView extends StatefulWidget {
  const BestSellerView({super.key});

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState
    extends BaseState<BestSellerView, BestSellerViewModel> {
  @override
  Widget build(BuildContext context) {
    var bestSellerList =
        ModalRoute.of(context)!.settings.arguments as List<Product>;
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<BestSellerViewModel, BestSellerStates>(
        listener: (context, state) {
          if (state is NavigatorToProductDetailsState) {
            Navigator.pushNamed(
              context,
              Routes.productDetailsRoute,
              arguments: state.product,
            );
          }
          if (state is AddItemToCartState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is AddItemToCartDoneState) {
            Navigator.pop(context);
          }
        },
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
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: bestSellerList.length,
            itemBuilder: (BuildContext context, int index) {
              return SlideInUp(
                duration: Duration(milliseconds: 500 + (index * 50)),
                child: ProductCardWidget(
                  product: bestSellerList[index],
                  onPressed: () {
                    viewModel.doIntent(
                        AddProductToCartAction(bestSellerList[index]));
                  },
                  onCardPressed: () {
                    viewModel.doIntent(
                      NavigatorToProductDetails(
                        product: bestSellerList[index],
                      ),
                    );
                  },
                  buttonTitle: viewModel.locale!.addToCart,
                  buttonIcon: Icons.shopping_cart_outlined,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  BestSellerViewModel initViewModel() {
    return getIt<BestSellerViewModel>();
  }
}
