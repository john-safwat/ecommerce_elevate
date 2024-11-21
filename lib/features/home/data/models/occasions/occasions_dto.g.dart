// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionsDto _$OccasionsDtoFromJson(Map<String, dynamic> json) => OccasionsDto(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OccasionsDtoToJson(OccasionsDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };
