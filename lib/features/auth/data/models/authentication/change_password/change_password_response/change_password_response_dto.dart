import 'package:ecommerce_elevate/features/auth/domain/entities/change_password/change_password_reaponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_response_dto.g.dart';

@JsonSerializable()
class ChangePasswordResponseDto {
  final String? message;
  final String? token;

  ChangePasswordResponseDto({this.message, this.token});

  factory ChangePasswordResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseDtoToJson(this);

  ChangePasswordReaponse toDomain() =>
      ChangePasswordReaponse(message: message, token: token);
}