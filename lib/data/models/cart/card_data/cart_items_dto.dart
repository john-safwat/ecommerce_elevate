// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/data/models/cart/card_data/cart_product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cart/cart_data/cart_items.dart';

part 'cart_items_dto.g.dart';

@JsonSerializable()
class CartItemsDto {
  @JsonKey(name: "product")
  final CartProductDto? product;
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

  CartItems toDomain() {
    return CartItems(
      product: product?.toDomain(),
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}
