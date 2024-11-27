import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';

sealed class BestSellerStates {}

class BestSellerInitial extends BestSellerStates {}

class NavigatorToProductDetailsState extends BestSellerStates {
  final Product product;

  NavigatorToProductDetailsState(this.product);
}
