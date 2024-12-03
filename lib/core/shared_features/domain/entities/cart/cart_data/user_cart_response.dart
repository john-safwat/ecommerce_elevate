import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/cart.dart';

class UserCartResponse {
  final String? message;
  int? numOfCartItems;
  final Cart? cart;

  UserCartResponse({
    this.message,
    this.numOfCartItems,
    this.cart,
  });
}
