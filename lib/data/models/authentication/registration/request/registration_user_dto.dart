// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/registration/registration_user.dart';
// 📦 Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'registration_user_dto.g.dart'; // Add this line

@JsonSerializable()
class RegistrationUserDto {
  RegistrationUserDto(
    this.gender,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  );

  final String? gender;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  // The factory constructor for deserialization
  factory RegistrationUserDto.fromJson(Map<String, dynamic> json) =>
      _$RegistrationUserDtoFromJson(json); // Add this line

  factory RegistrationUserDto.fromDomain(RegistrationUser user) =>
      RegistrationUserDto(user.gender, user.firstName, user.lastName,
          user.email, user.password, user.rePassword, user.phone);

  // The toJson method for serialization
  Map<String, dynamic> toJson() => _$RegistrationUserDtoToJson(this);
}
