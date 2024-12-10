// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_address_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveAddressResponseDto _$RemoveAddressResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RemoveAddressResponseDto(
      message: json['message'] as String?,
      addresses: (json['address'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoveAddressResponseDtoToJson(
        RemoveAddressResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'address': instance.addresses,
    };
