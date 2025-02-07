// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_response.dart';
// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ResetPasswordResponseDto({
    this.message,
    this.token,
  });

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseDtoToJson(this);
  }

  ResetPasswordResponse toDomain() =>
      ResetPasswordResponse(message: message, token: token);
}
