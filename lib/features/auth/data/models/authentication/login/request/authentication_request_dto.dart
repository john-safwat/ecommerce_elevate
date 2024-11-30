// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_request_dto.g.dart';

@JsonSerializable()
class AuthenticationRequestDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  AuthenticationRequestDto({
    this.email,
    this.password,
  });

  factory AuthenticationRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AuthenticationRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthenticationRequestDtoToJson(this);
  }

  factory AuthenticationRequestDto.fromDomain(
          AuthenticationRequest authentication) =>
      AuthenticationRequestDto(
          email: authentication.email, password: authentication.password);
}
