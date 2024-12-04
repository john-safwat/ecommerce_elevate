// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
      id: json['_id'] as String?,
      user: json['user'] as String?,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'cartItems': instance.cartItems,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
