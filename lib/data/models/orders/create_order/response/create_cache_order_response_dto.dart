import 'package:json_annotation/json_annotation.dart';

part 'create_cache_order_response_dto.g.dart';

@JsonSerializable()
class CreateCacheOrderResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "order")
  final OrderDto? order;

  CreateCacheOrderResponseDto ({
    this.message,
    this.order,
  });

  factory CreateCacheOrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CreateCacheOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateCacheOrderResponseDtoToJson(this);
  }
}

@JsonSerializable()
class OrderDto {
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "orderItems")
  final List<OrderItemsDto>? orderItems;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "paymentType")
  final String? paymentType;
  @JsonKey(name: "isPaid")
  final bool? isPaid;
  @JsonKey(name: "isDelivered")
  final bool? isDelivered;
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  OrderDto ({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) {
    return _$OrderDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderDtoToJson(this);
  }
}

@JsonSerializable()
class OrderItemsDto {
  @JsonKey(name: "product")
  final String? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? id;

  OrderItemsDto ({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  factory OrderItemsDto.fromJson(Map<String, dynamic> json) {
    return _$OrderItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderItemsDtoToJson(this);
  }
}


