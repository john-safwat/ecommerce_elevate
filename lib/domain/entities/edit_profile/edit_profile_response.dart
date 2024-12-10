
import 'package:ecommerce_elevate/domain/entities/user/user.dart';

class EditProfileResponse {
  final String? message;
  final User? user;

  EditProfileResponse({
    required this.message,
    required this.user,
  });
}
