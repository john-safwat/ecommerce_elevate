// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_product_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProductsResponseDto _$DeleteProductsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    DeleteProductsResponseDto(
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cart: json['cart'] == null
          ? null
          : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteProductsResponseDtoToJson(
        DeleteProductsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      Id: json['_id'] as String?,
      user: json['user'] as String?,
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      '_id': instance.Id,
      'user': instance.user,
      'cartItems': instance.cartItems,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      Id: json['_id'] as String?,
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.Id,
    };
