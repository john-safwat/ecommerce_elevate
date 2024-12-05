// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCartResponseDto _$UserCartResponseDtoFromJson(Map<String, dynamic> json) =>
    UserCartResponseDto(
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cart: json['cart'] == null
          ? null
          : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCartResponseDtoToJson(
        UserCartResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };
