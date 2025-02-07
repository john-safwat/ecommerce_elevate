// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/cart_product.dart';

class CartItems {
  final CartProduct? product;
  final int? price;
  final int? quantity;
  final String? id;

  CartItems({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });
}
