// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetadataResponse _$MetadataResponseFromJson(Map<String, dynamic> json) =>
    MetadataResponse(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataResponseToJson(MetadataResponse instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };
