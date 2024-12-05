// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/response/add_to_cart_response.dart';

part 'add_to_cart_response_dto.g.dart';

@JsonSerializable()
class AddToCartResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cart")
  final CartDto? cart;

  AddToCartResponseDto({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  factory AddToCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddToCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddToCartResponseDtoToJson(this);
  }

  AddToCartResponse toDomain() => AddToCartResponse(
        message: message,
        numOfCartItems: numOfCartItems,
        cart: cart?.toDomain(),
      );
}

@JsonSerializable()
class CartDto {
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "cartItems")
  final List<CartItemsDto>? cartItems;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  CartDto({
    this.user,
    this.cartItems,
    this.id,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return _$CartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartDtoToJson(this);
  }

  Cart toDomain() => Cart(
        user: user,
        cartItems: cartItems
            ?.map(
              (e) => e.toDomain(),
            )
            .toList(),
        id: id,
        totalPrice: totalPrice,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );
}

@JsonSerializable()
class CartItemsDto {
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? id;

  CartItemsDto({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  factory CartItemsDto.fromJson(Map<String, dynamic> json) {
    return _$CartItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsDtoToJson(this);
  }

  CartItems toDomain() => CartItems(
        product: product,
        price: price,
        quantity: quantity,
        id: id,
      );
}
