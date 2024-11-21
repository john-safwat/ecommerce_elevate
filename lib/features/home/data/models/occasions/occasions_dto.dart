import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'occasions_dto.g.dart';

@JsonSerializable()
class OccasionsDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  OccasionsDto({this.id, this.name, this.slug, this.image});
  factory OccasionsDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionsDtoFromJson(json);
  }
  Occasions toDomain() {
    return Occasions(slug: slug, id: id, name: name, image: image);
  }
}
