import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/cateogry/Categories.dart';
part 'categories_dto.g.dart';

@JsonSerializable()
class CategoriesDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  CategoriesDto({this.id, this.name, this.slug, this.image});
  factory CategoriesDto.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDtoFromJson(json);
  Categories toDomain() {
    return Categories(name: name, id: id, image: image, slug: slug);
  }
}
