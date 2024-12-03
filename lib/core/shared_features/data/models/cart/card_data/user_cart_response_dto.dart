import 'package:ecommerce_elevate/core/shared_features/data/models/cart/card_data/cart_dto.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_cart_response_dto.g.dart';

@JsonSerializable()
class UserCartResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cart")
  final CartDto? cart;

  UserCartResponseDto({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  factory UserCartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UserCartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserCartResponseDtoToJson(this);
  }

  UserCartResponse toDomain() => UserCartResponse(
        message: message,
        numOfCartItems: numOfCartItems,
        cart: cart?.toDomain(),
      );
}
