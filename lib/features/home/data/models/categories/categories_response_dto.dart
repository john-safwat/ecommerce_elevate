// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/features/home/data/models/categories/category_dto.dart';
import 'package:ecommerce_elevate/features/home/data/models/categories/metadata_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response_dto.g.dart';

@JsonSerializable()
class CategoriesResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "categories")
  final List<CategoryDto>? categories;

  CategoriesResponseDto({
    this.message,
    this.metadata,
    this.categories,
  });

  factory CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesResponseDtoToJson(this);
  }
}
