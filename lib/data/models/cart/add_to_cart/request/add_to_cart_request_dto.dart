// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_request_dto.g.dart';

@JsonSerializable()
class AddToCartRequestDto {
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "quantity")
  final int? quantity;

  AddToCartRequestDto({
    this.product,
    this.quantity,
  });

  factory AddToCartRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddToCartRequestDtoFromJson(json);
  }

  factory AddToCartRequestDto.fromDomain(AddToCartRequest request) =>
      AddToCartRequestDto(
        product: request.product,
        quantity: request.quantity,
      );

  Map<String, dynamic> toJson() {
    return _$AddToCartRequestDtoToJson(this);
  }
}
