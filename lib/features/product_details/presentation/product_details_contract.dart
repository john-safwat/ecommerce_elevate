import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class ProductDetailsAction extends BaseAction {}

class ChangeCurrentPageIndexAction extends ProductDetailsAction {
  final int index;

  ChangeCurrentPageIndexAction(this.index);
}

sealed class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsChangeCurrentPageIndex extends ProductDetailsState {}
