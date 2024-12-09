import 'package:ecommerce_elevate/data/models/addresses/response/address_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_address_response_dto.g.dart';

@JsonSerializable()
class AddAddressResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "error")
  final String? error;
  @JsonKey(name: "address")
  final List<AddressDto>? address;

  AddAddressResponseDto({
    this.message,
    this.error,
    this.address,
  });

  factory AddAddressResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddAddressResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddAddressResponseDtoToJson(this);
  }
}
