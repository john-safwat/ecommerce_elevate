import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/product_details/presentation/product_details_contract.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel
    extends BaseViewModel<ProductDetailsState, ProductDetailsAction> {
  ProductDetailsViewModel() : super(ProductDetailsInitial());
  PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  Future<void> doIntent(ProductDetailsAction action) async {
    switch (action) {
      case ChangeCurrentPageIndexAction():
        {
          _changeCurrentPageIndex(action.index);
        }
    }
  }

  _changeCurrentPageIndex(int index) {
    currentPageIndex = index;
    emit(ProductDetailsChangeCurrentPageIndex());
  }


}
