import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_address_request_dto.g.dart';

@JsonSerializable()
class AddAddressRequestDto {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;

  AddAddressRequestDto({
    this.street,
    this.phone,
    this.city,
  });

  factory AddAddressRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddAddressRequestDtoFromJson(json);
  }

  factory AddAddressRequestDto.fromDomain(AddAddressRequest request) =>
      AddAddressRequestDto(
        street: request.street,
        phone: request.phone,
        city: request.city,
      );

  Map<String, dynamic> toJson() {
    return _$AddAddressRequestDtoToJson(this);
  }
}
