// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products_respons_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllProductsResponsDto _$AllProductsResponsDtoFromJson(
        Map<String, dynamic> json) =>
    AllProductsResponsDto(
      message: json['message'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllProductsResponsDtoToJson(
        AllProductsResponsDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'products': instance.products,
    };
