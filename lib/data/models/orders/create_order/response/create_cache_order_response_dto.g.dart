// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_cache_order_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCacheOrderResponseDto _$CreateCacheOrderResponseDtoFromJson(
        Map<String, dynamic> json) =>
    CreateCacheOrderResponseDto(
      message: json['message'] as String?,
      order: json['order'] == null
          ? null
          : OrderDto.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCacheOrderResponseDtoToJson(
        CreateCacheOrderResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      user: json['user'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      paymentType: json['paymentType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'user': instance.user,
      'orderItems': instance.orderItems,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

OrderItemsDto _$OrderItemsDtoFromJson(Map<String, dynamic> json) =>
    OrderItemsDto(
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$OrderItemsDtoToJson(OrderItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
