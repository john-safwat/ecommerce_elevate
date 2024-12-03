// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class ProductDetailsAction extends BaseAction {}

class ChangeCurrentPageIndexAction extends ProductDetailsAction {
  final int index;

  ChangeCurrentPageIndexAction(this.index);
}

class AddItemToCartAction extends ProductDetailsAction {}

sealed class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsChangeCurrentPageIndex extends ProductDetailsState {}
class AddItemToCartLoadingState extends ProductDetailsState {}