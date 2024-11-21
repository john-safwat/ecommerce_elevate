import 'package:ecommerce_elevate/features/home/data/models/best_seller/best_seller_dto.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/metadata/metadata_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'best_seller_response_dto.g.dart';
@JsonSerializable()
class BestSellerResponseDto {
  @JsonKey(name: 'message')
  final String? message;
  final MetadataResponse? metadataResponse;
  final List<BestSellerDto>? bestseller;

  BestSellerResponseDto({this.message, this.metadataResponse, this.bestseller});
  factory BestSellerResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BestSellerResponseDtoFromJson(json);
  }
}