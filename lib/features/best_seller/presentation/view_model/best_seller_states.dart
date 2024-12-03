// 🌎 Project imports:
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';

sealed class BestSellerStates {}

class BestSellerInitial extends BestSellerStates {}

class AddItemToCartState extends BestSellerStates {}

class AddItemToCartDoneState extends BestSellerStates {}

class NavigatorToProductDetailsState extends BestSellerStates {
  final Product product;

  NavigatorToProductDetailsState(this.product);
}
