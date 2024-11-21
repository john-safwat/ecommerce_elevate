import 'package:ecommerce_elevate/features/home/domain/entities/best_seller/best_seller.dart';
import 'package:json_annotation/json_annotation.dart';
part 'best_seller_dto.g.dart';
@JsonSerializable()
class BestSellerDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final  int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;

  BestSellerDto(
      {
        this.id,
        this.title,
        this.slug,
        this.description,
        this.imgCover,
        this.images,
        this.price,
        this.priceAfterDiscount,
        this.quantity,
        this.category,
        this.occasion
      });

  factory BestSellerDto.fromJson(Map<String, dynamic> json) {
    return _$BestSellerDtoFromJson(json);
  }
  BestSeller toDomain(){
    return BestSeller(
        category: category,
        description: description,
        id: id,
        images: images,
        imgCover: imgCover,
        occasion: occasion,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        quantity: quantity,
        slug: slug,
        title: title
    );
  }

}
