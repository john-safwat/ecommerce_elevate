import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/cart_items.dart';

class Cart {
  final String? id;
  final String? user;
  final List<CartItems>? cartItems;
  int? totalPrice;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Cart({
    this.id,
    this.user,
    this.cartItems,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
}
