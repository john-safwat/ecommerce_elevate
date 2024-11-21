// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasions_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OccasionsResponseDto _$OccasionsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    OccasionsResponseDto(
      message: json['message'] as String?,
      metadataResponse: json['metadataResponse'] == null
          ? null
          : MetadataResponse.fromJson(
              json['metadataResponse'] as Map<String, dynamic>),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => OccasionsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OccasionsResponseDtoToJson(
        OccasionsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadataResponse': instance.metadataResponse,
      'occasions': instance.occasions,
    };
