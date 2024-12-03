import 'package:ecommerce_elevate/core/shared_features/data/models/cart/card_data/cart_items_dto.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_dto.g.dart';

@JsonSerializable()
class CartDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "cartItems")
  final List<CartItemsDto>? cartItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  CartDto({
    this.id,
    this.user,
    this.cartItems,
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
