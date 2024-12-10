// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/cart_product.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/features/checkout/checkout_view.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/view_model/cart_tab_events.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/view_model/cart_tab_states.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/view_model/cart_tab_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/widgets/billing_information.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/widgets/product_widget.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/widgets/title_widget.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../domain/entities/cart/cart_data/cart_items.dart';

class CartTabView extends StatefulWidget {
  const CartTabView({super.key});

  @override
  State<CartTabView> createState() => _CartTabViewState();
}

class _CartTabViewState extends BaseState<CartTabView, CartTabViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(GetLocation());
    viewModel.doIntent(LoadData());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: viewModel,
      child: BlocConsumer<CartTabViewModel, CartTabStates>(
        listener: (context, state) {
          if (state.navigationState is NavigateToLoginScreen) {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }
          if (state.navigationState is NavigateToCheckoutScreen) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutView(
                  userCartResponse:
                      (state.navigationState as NavigateToCheckoutScreen)
                          .userCartResponse ,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (viewModel.appConfigProvider!.token.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AnimationsAssets.loginImageAnimation),
                const SizedBox(height: 8),
                Text(
                  viewModel.locale!.youMustBeLoggedIn,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    viewModel.doIntent(OnLoginPressAction());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Text(viewModel.locale!.login),
                  ),
                )
              ],
            );
          } else {
            UserCartResponse? response = state.userCartState
                    is CartTabLoadingSuccessState<UserCartResponse>
                ? (state.userCartState.data as UserCartResponse)
                : null;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TitleWidget(viewModel),
                    Expanded(
                        child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemBuilder: (context, index) => Skeletonizer(
                        enabled: (response == null),
                        child: ProductWidget(
                          index: index,
                          item: (response != null)
                              ? response.cart!.cartItems![index]
                              : CartItems(
                                  quantity: 10,
                                  price: 323,
                                  product: CartProduct(
                                      imgCover: "-----------------",
                                      title: "----------------",
                                      description: "------------------")),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: (response != null)
                          ? response.cart?.cartItems?.length ?? 0
                          : 20,
                    )),
                    BillingInformation(response, viewModel)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  CartTabViewModel initViewModel() {
    return getIt<CartTabViewModel>();
  }
}
