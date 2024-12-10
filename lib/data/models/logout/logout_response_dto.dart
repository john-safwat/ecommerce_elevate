// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/logout/logout_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_response_dto.g.dart';

@JsonSerializable()
class LogoutResponseDto {
  @JsonKey(name: "message")
  final String? message;

  LogoutResponseDto({
    this.message,
  });

  factory LogoutResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LogoutResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LogoutResponseDtoToJson(this);
  }

  LogoutResponse toDomain() {
    return LogoutResponse(
      message: message,
    );
  }
}
