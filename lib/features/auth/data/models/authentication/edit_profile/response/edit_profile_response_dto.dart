import 'package:ecommerce_elevate/features/auth/data/models/user_info/user_dto.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/edit_profile/edit_profile_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_dto.g.dart';

@JsonSerializable()
class EditProfileResponseDto {
  final String? message;
  final UserDto? user;

  EditProfileResponseDto({
    required this.message,
    required this.user,
  });

  factory EditProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseDtoToJson(this);

  EditProfileResponse toDomain() => EditProfileResponse(
        message: message,
        user: user?.toDomain(),
      );
}
