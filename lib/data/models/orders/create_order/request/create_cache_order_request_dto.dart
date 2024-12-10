import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_cache_order_request_dto.g.dart';

@JsonSerializable()
class CreateCacheOrderRequestDto {
  @JsonKey(name: "shippingAddress")
  final ShippingAddressDto? shippingAddress;

  CreateCacheOrderRequestDto({
    this.shippingAddress,
  });

  factory CreateCacheOrderRequestDto.fromJson(Map<String, dynamic> json) {
    return _$CreateCacheOrderRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateCacheOrderRequestDtoToJson(this);
  }
}

@JsonSerializable()
class ShippingAddressDto {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;

  ShippingAddressDto({
    this.street,
    this.phone,
    this.city,
  });

  factory ShippingAddressDto.fromJson(Map<String, dynamic> json) {
    return _$ShippingAddressDtoFromJson(json);
  }

  factory ShippingAddressDto.fromDomain(Address address) => ShippingAddressDto(
        street: address.street,
        phone: address.phone,
        city: address.city,
      );

  Map<String, dynamic> toJson() {
    return _$ShippingAddressDtoToJson(this);
  }
}
