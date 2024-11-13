import 'package:ecommerce_elevate/features/auth/domain/entities/user/user.dart';

class RegistrationResponse {
  RegistrationResponse({this.message, this.token, this.code, this.user});

  String? message;
  String? token;
  num? code;
  User? user;
}
