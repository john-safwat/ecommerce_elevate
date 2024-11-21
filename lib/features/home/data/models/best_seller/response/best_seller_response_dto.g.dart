// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerResponseDto _$BestSellerResponseDtoFromJson(
        Map<String, dynamic> json) =>
    BestSellerResponseDto(
      message: json['message'] as String?,
      metadataResponse: json['metadataResponse'] == null
          ? null
          : MetadataResponse.fromJson(
              json['metadataResponse'] as Map<String, dynamic>),
      bestseller: (json['bestseller'] as List<dynamic>?)
          ?.map((e) => BestSellerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BestSellerResponseDtoToJson(
        BestSellerResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadataResponse': instance.metadataResponse,
      'bestseller': instance.bestseller,
    };
