// 📦 Package imports:
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:json_annotation/json_annotation.dart';

class LoggedUser {
  final List<dynamic>? wishlist;
  final String? id;
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
  final List<Address>? addresses;

  LoggedUser({
    this.wishlist,
    this.id,
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
