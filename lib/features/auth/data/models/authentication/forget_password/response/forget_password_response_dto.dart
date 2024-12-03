// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/features/auth/domain/entities/forgetPassword/forget_password_response.dart';
// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "info")
  final String? info;
  @JsonKey(name: "code")
  final num? code;

  ForgetPasswordResponseDto({this.message, this.info, this.code});

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordResponseDtoToJson(this);
  }

  ForgetPasswordResponse toDomain() =>
      ForgetPasswordResponse(message: message, info: info, code: code?.toInt());
}
