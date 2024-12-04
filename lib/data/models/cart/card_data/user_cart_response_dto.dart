// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/data/models/cart/card_data/cart_dto.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';

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
