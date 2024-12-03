import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/user/logged_user.dart';

import '../../../../auth/domain/entities/user/user.dart';

class ProfileResponse {
  String? message;
  LoggedUser? user;

  ProfileResponse({this.message, this.user});

}