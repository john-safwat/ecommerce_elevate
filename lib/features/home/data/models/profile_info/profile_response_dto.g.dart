// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseDto _$ProfileResponseDtoFromJson(Map<String, dynamic> json) =>
    ProfileResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : LoggedUserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseDtoToJson(ProfileResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
