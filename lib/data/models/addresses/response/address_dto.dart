import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
  @JsonKey(name: "street")
  final String? street;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "_id")
  final String? id;

  AddressDto({
    this.street,
    this.phone,
    this.city,
    this.id,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddressDtoToJson(this);
  }

  Address toDomain() => Address(
        street: street,
        phone: phone,
        city: city,
        id: id,
      );
}
