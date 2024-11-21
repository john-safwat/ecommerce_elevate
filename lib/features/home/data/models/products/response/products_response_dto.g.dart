// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseDto _$ProductsResponseDtoFromJson(Map<String, dynamic> json) =>
    ProductsResponseDto(
      message: json['message'] as String?,
      metadataResponse: json['metadataResponse'] == null
          ? null
          : MetadataResponse.fromJson(
              json['metadataResponse'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => ProductsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseDtoToJson(
        ProductsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadataResponse': instance.metadataResponse,
      'categories': instance.categories,
    };
