import 'package:ecommerce_elevate/features/auth/domain/entities/user/user.dart';

class EditProfileResponse {
  final String? message;
  final User? user;

  EditProfileResponse({
    required this.message,
    required this.user,
  });
}
