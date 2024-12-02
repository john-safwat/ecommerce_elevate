import 'package:ecommerce_elevate/features/auth/domain/entities/user/user.dart';

class GetUserInfoResponse {
  final String? message;
  final User? user;

  GetUserInfoResponse({
    required this.message,
    required this.user,
  });
}
