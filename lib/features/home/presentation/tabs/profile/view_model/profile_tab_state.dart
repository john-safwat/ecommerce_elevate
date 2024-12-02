import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/user/logged_user.dart';

sealed class ProfileTabState {}

class ProfileInitialState extends ProfileTabState {}
class ProfileLoadingState extends ProfileTabState {}
class ProfileFailState extends ProfileTabState {
  final String message;
  Exception exception;

  ProfileFailState(this.message, this.exception);

}
class ProfileSuccessState extends ProfileTabState {
  LoggedUser user ;

  ProfileSuccessState(this.user);
}


