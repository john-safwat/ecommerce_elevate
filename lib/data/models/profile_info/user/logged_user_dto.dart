// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/profile_info/user/logged_user.dart';

part 'logged_user_dto.g.dart';

@JsonSerializable()
class LoggedUserDto {
  @JsonKey(name: "wishlist")
  final List<dynamic>? wishlist;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "passwordResetCode")
  final String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  final String? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  final bool? resetCodeVerified;
  @JsonKey(name: "passwordChangedAt")
  final String? passwordChangedAt;
  @JsonKey(name: "addresses")
  final List<dynamic>? addresses;

  LoggedUserDto({
    this.wishlist,
    this.Id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
    this.addresses,
  });

  factory LoggedUserDto.fromJson(Map<String, dynamic> json) {
    return _$LoggedUserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoggedUserDtoToJson(this);
  }

  LoggedUser toDomain() {
    return LoggedUser(
      wishlist: wishlist,
      Id: Id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      createdAt: createdAt,
      passwordResetCode: passwordResetCode,
      passwordResetExpires: passwordResetExpires,
      resetCodeVerified: resetCodeVerified,
      passwordChangedAt: passwordChangedAt,
      addresses: addresses,
    );
  }
}
