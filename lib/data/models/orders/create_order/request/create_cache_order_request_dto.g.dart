// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_cache_order_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCacheOrderRequestDto _$CreateCacheOrderRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateCacheOrderRequestDto(
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddressDto.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCacheOrderRequestDtoToJson(
        CreateCacheOrderRequestDto instance) =>
    <String, dynamic>{
      'shippingAddress': instance.shippingAddress,
    };

ShippingAddressDto _$ShippingAddressDtoFromJson(Map<String, dynamic> json) =>
    ShippingAddressDto(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$ShippingAddressDtoToJson(ShippingAddressDto instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
    };
