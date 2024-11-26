// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request_dto.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  @JsonKey(name: "email")
  final String? email;

  ForgetPasswordRequestDto({
    this.email,
  });

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordRequestDtoToJson(this);
  }
}
