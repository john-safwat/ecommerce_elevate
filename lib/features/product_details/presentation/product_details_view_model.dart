// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/product_details/presentation/product_details_contract.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel
    extends BaseViewModel<ProductDetailsState, ProductDetailsAction> {
  ProductDetailsViewModel() : super(ProductDetailsInitial());
  PageController pageController = PageController();
  int currentPageIndex = 0;
  late Product product;

  @override
  Future<void> doIntent(ProductDetailsAction action) async {
    switch (action) {
      case ChangeCurrentPageIndexAction():
        {
          _changeCurrentPageIndex(action.index);
        }
      case AddItemToCartAction():
        {
          await _addItemToCart();
        }
    }
  }

  _changeCurrentPageIndex(int index) {
    currentPageIndex = index;
    emit(ProductDetailsChangeCurrentPageIndex());
  }

  Future<void> _addItemToCart() async {
    await addProductToCart(
      AddToCartRequest(
        quantity: 1,
        product: product.id,
      ),
      AddItemToCartLoadingState(),
    );
    emit(ProductDetailsInitial());
  }
}
