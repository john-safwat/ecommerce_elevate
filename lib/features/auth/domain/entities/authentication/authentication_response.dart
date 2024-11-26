// 🌎 Project imports:
import 'package:ecommerce_elevate/features/auth/domain/entities/user/user.dart';

class AuthenticationResponse {
  final String? message;
  final String? token;
  final num? code;
  final User? user;

  AuthenticationResponse({this.message, this.token, this.code, this.user});
}
