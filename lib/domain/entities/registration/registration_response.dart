// 🌎 Project imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/user/user.dart';

class RegistrationResponse {
  RegistrationResponse({this.message, this.token, this.code, this.user});

  String? message;
  String? token;
  num? code;
  User? user;
}
