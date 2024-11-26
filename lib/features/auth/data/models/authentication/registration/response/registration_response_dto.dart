// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/features/auth/data/models/user_info/user_dto.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart';

part 'registration_response_dto.g.dart';

@JsonSerializable()
class RegistrationResponseDto {
  RegistrationResponseDto({this.message, this.token, this.code});

  factory RegistrationResponseDto.fromJson(dynamic json) =>
      _$RegistrationResponseDtoFromJson(json);

  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "code")
  num? code;
  @JsonKey(name: "user")
  UserDto? user;

  Map<String, dynamic> toJson() => _$RegistrationResponseDtoToJson(this);

  RegistrationResponse toDomain() {
    return RegistrationResponse(
        message: message, token: token, code: code, user: user?.toDomain());
  }
}
