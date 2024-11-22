import 'package:ecommerce_elevate/features/home/data/models/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_response_dto.g.dart';

@JsonSerializable()
class BestSellerResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "bestSeller")
  final List<ProductDto>? bestSeller;

  BestSellerResponseDto({
    this.message,
    this.bestSeller,
  });

  factory BestSellerResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BestSellerResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BestSellerResponseDtoToJson(this);
  }
}
