// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequestDto _$AuthenticationRequestDtoFromJson(
        Map<String, dynamic> json) =>
    AuthenticationRequestDto(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthenticationRequestDtoToJson(
        AuthenticationRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };