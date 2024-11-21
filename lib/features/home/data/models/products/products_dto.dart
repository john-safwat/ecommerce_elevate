import 'package:ecommerce_elevate/features/home/domain/entities/products/products.dart';
import 'package:json_annotation/json_annotation.dart';
part 'products_dto.g.dart';

@JsonSerializable()
class ProductsDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;

  ProductsDto(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.imgCover,
      this.images,
      this.price,
      this.priceAfterDiscount,
      this.quantity,
      this.category,
      this.occasion});

  factory ProductsDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsDtoFromJson(json);
  }
  Products toDomain() {
    return Products(
        id: id,
        slug: slug,
        title: title,
        quantity: quantity,
        priceAfterDiscount: priceAfterDiscount,
        price: price,
        occasion: occasion,
        imgCover: imgCover,
        images: images,
        description: description,
        category: category);
  }
}
