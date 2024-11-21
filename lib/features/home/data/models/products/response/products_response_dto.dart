import 'package:ecommerce_elevate/features/home/data/models/products/products_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/metadata/metadata_response.dart';

part 'products_response_dto.g.dart';
@JsonSerializable()
class ProductsResponseDto {
  @JsonKey(name: 'message')
  final String? message;
  final MetadataResponse? metadataResponse;
  final List<ProductsDto>? categories;

  ProductsResponseDto({this.message, this.metadataResponse, this.categories});
  factory ProductsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseDtoFromJson(json);
  }}