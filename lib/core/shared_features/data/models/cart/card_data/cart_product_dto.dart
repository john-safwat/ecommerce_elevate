import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/cart_product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_product_dto.g.dart';

@JsonSerializable()
class CartProductDto {
  @JsonKey(name: "_id")
  final String? productId;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "occasion")
  final String? occasion;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "id")
  final String? id;

  CartProductDto({
    this.productId,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.id,
  });

  factory CartProductDto.fromJson(Map<String, dynamic> json) {
    return _$CartProductDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartProductDtoToJson(this);
  }

  CartProduct toDomain() {
    return CartProduct(
      productId: productId,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      discount: discount,
      id: id,
    );
  }
}
