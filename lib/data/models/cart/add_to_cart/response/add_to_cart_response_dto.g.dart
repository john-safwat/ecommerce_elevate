// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponseDto _$AddToCartResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddToCartResponseDto(
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cart: json['cart'] == null
          ? null
          : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToCartResponseDtoToJson(
        AddToCartResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
      user: json['user'] as String?,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['_id'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
      'user': instance.user,
      'cartItems': instance.cartItems,
      '_id': instance.id,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

CartItemsDto _$CartItemsDtoFromJson(Map<String, dynamic> json) => CartItemsDto(
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$CartItemsDtoToJson(CartItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
