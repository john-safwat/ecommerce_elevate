// 🌎 Project imports:
import 'cart.dart';

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
