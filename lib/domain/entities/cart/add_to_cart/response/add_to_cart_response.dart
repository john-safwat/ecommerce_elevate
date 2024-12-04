class AddToCartResponse {
  final String? message;
  final int? numOfCartItems;
  final Cart? cart;

  AddToCartResponse({
    this.message,
    this.numOfCartItems,
    this.cart,
  });
}

class Cart {
  final String? user;
  final List<CartItems>? cartItems;
  final String? id;
  final int? totalPrice;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Cart({
    this.user,
    this.cartItems,
    this.id,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
}

class CartItems {
  final String? product;
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
