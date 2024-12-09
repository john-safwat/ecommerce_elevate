// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressRequestDto _$AddAddressRequestDtoFromJson(
        Map<String, dynamic> json) =>
    AddAddressRequestDto(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$AddAddressRequestDtoToJson(
        AddAddressRequestDto instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
    };
