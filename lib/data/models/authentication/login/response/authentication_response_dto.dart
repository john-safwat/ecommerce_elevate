// 📦 Package imports:

// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/data/models/user_info/user_dto.dart';
import 'package:ecommerce_elevate/domain/entities/authentication/authentication_response.dart';

part 'authentication_response_dto.g.dart';

@JsonSerializable()
class AuthenticationResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "code")
  final num? code;
  @JsonKey(name: "user")
  UserDto? user;

  AuthenticationResponseDto({this.message, this.token, this.code});

  factory AuthenticationResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AuthenticationResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthenticationResponseDtoToJson(this);
  }

  AuthenticationResponse toDomain() => AuthenticationResponse(
      message: message, code: code, token: token, user: user?.toDomain());
}
