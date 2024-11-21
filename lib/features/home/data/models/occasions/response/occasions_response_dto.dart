import 'package:ecommerce_elevate/features/home/data/models/occasions/occasions_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/metadata/metadata_response.dart';

part 'occasions_response_dto.g.dart';
@JsonSerializable()
class OccasionsResponseDto {
  @JsonKey(name: 'message')
  final String? message;
  final MetadataResponse? metadataResponse;
  final List<OccasionsDto>? occasions;

  OccasionsResponseDto({this.message, this.metadataResponse, this.occasions});
  factory OccasionsResponseDto.fromJson(Map<String, dynamic> json) {
  return _$OccasionsResponseDtoFromJson(json);
  }
}