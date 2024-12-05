// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/data/models/profile_info/user/logged_user_dto.dart';
import 'package:ecommerce_elevate/domain/entities/profile_info/profile_response.dart';

part 'profile_response_dto.g.dart';

@JsonSerializable()
class ProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final LoggedUserDto? user;

  ProfileResponseDto({
    this.message,
    this.user,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileResponseDtoToJson(this);
  }

  ProfileResponse toDomain() {
    return ProfileResponse(
      message: message,
      user: user?.toDomain(),
    );
  }
}
