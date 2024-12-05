// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/profile_info/user/logged_user.dart';

class ProfileResponse {
  String? message;
  LoggedUser? user;

  ProfileResponse({this.message, this.user});
}
