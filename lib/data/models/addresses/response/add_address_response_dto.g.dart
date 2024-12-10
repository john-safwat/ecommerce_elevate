// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressResponseDto _$AddAddressResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddAddressResponseDto(
      message: json['message'] as String?,
      error: json['error'] as String?,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddAddressResponseDtoToJson(
        AddAddressResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'address': instance.address,
    };
