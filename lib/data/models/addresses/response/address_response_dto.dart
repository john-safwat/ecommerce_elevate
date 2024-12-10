import 'package:ecommerce_elevate/data/models/addresses/response/address_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_response_dto.g.dart';

@JsonSerializable()
class AddressResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "error")
  final String? error;
  @JsonKey(name: "address")
  final List<AddressDto>? address;
  @JsonKey(name: "addresses")
  final List<AddressDto>? addresses;

  AddressResponseDto({
    this.message,
    this.error,
    this.address,
    this.addresses
  });

  factory AddressResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddressResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressResponseDtoToJson(this);
  }
}
