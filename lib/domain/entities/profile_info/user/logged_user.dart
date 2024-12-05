// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoggedUser {
  final List<dynamic>? wishlist;
  final String? Id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? createdAt;
  final String? passwordResetCode;
  final String? passwordResetExpires;
  final bool? resetCodeVerified;
  final String? passwordChangedAt;
  final List<dynamic>? addresses;

  LoggedUser({
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
}
