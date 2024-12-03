import 'package:ecommerce_elevate/features/auth/data/models/user_info/user_dto.dart';
import 'package:ecommerce_elevate/features/home/data/models/profile_info/user/logged_user_dto.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../auth/domain/entities/user/user.dart';


part 'profile_response_dto.g.dart';

@JsonSerializable()
class ProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final LoggedUserDto? user;

  ProfileResponseDto ({
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



