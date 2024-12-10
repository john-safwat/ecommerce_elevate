// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/data/models/addresses/response/address_dto.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/remove_addresses/response/remove_address_response.dart';

import 'package:json_annotation/json_annotation.dart';

part 'remove_address_response_dto.g.dart';

@JsonSerializable()
class RemoveAddressResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "address")
  final List<AddressDto>? addresses;

  RemoveAddressResponseDto({
    this.message,
    this.addresses,
  });

  factory RemoveAddressResponseDto.fromJson(Map<String, dynamic> json) {
    return _$RemoveAddressResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RemoveAddressResponseDtoToJson(this);
  }
  RemoveAddressResponse toDomain (){
    return RemoveAddressResponse(
      addresses: addresses?.map((e) => e.toDomain(),).toList(),
      message: message
    );
  }


}
