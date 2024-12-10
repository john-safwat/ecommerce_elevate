// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseDto _$AddressResponseDtoFromJson(Map<String, dynamic> json) =>
    AddressResponseDto(
      message: json['message'] as String?,
      error: json['error'] as String?,
      address: (json['address'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseDtoToJson(AddressResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'address': instance.address,
      'addresses': instance.addresses,
    };
