// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:json_annotation/json_annotation.dart';

// 🌎 Project imports:

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  CategoryDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return _$CategoryDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryDtoToJson(this);
  }

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
