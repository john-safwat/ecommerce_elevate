import 'package:ecommerce_elevate/features/auth/data/models/user_info/user_dto.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/user_info/user_info_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_info_response_dto.g.dart';

@JsonSerializable()
class GetUserInfoResponseDto {
  final String? message;
  final UserDto? user;

  GetUserInfoResponseDto({this.message, this.user});

  factory GetUserInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserInfoResponseDtoToJson(this);

  GetUserInfoResponse toDomain() {
    return GetUserInfoResponse(message: message, user: user?.toDomain());
  }
}
