// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedUserDto _$LoggedUserDtoFromJson(Map<String, dynamic> json) =>
    LoggedUserDto(
      wishlist: json['wishlist'] as List<dynamic>?,
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      passwordResetCode: json['passwordResetCode'] as String?,
      passwordResetExpires: json['passwordResetExpires'] as String?,
      resetCodeVerified: json['resetCodeVerified'] as bool?,
      passwordChangedAt: json['passwordChangedAt'] as String?,
      addresses: json['addresses'] as List<dynamic>?,
    );

Map<String, dynamic> _$LoggedUserDtoToJson(LoggedUserDto instance) =>
    <String, dynamic>{
      'wishlist': instance.wishlist,
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'passwordResetCode': instance.passwordResetCode,
      'passwordResetExpires': instance.passwordResetExpires,
      'resetCodeVerified': instance.resetCodeVerified,
      'passwordChangedAt': instance.passwordChangedAt,
      'addresses': instance.addresses,
    };
