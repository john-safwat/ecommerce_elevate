import 'package:ecommerce_elevate/features/home/data/models/cateogry/categories_dto.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/metadata/metadata_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response_dto.g.dart';
@JsonSerializable()
class CategoriesResponseDto {
  @JsonKey(name: 'message')
  final String? message;
  final MetadataResponse? metadataResponse;
  final List<CategoriesDto>? categories;

  CategoriesResponseDto({this.message, this.metadataResponse, this.categories});
  factory CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponseDtoFromJson(json);
  }
}