// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/shared_features/data/models/occasions/metadata_dto.dart';
import 'package:ecommerce_elevate/core/shared_features/data/models/occasions/occasion_dto.dart';
// 🌎 Project imports:
import 'package:json_annotation/json_annotation.dart';

part 'occasions_response_dto.g.dart';

@JsonSerializable()
class OccasionResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "occasions")
  final List<OccasionDto>? occasions;

  OccasionResponseDto({
    this.message,
    this.metadata,
    this.occasions,
  });

  factory OccasionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionResponseDtoToJson(this);
  }
}
