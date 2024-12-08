// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/entities/profile_info/user/logged_user.dart';

sealed class ProfileTabStates {}

class ProfileInitialState extends ProfileTabStates {}

class ProfileLoadingState extends ProfileTabStates {}

class ProfileNavigatorToAboutUs extends ProfileTabStates {}

class ProfileFailState extends ProfileTabStates {
  final String message;
  Exception exception;

  ProfileFailState(this.message, this.exception);
}

class ProfileSuccessState extends ProfileTabStates {
  LoggedUser user;

  ProfileSuccessState(this.user);
}

class NavigateToLoginState extends ProfileTabStates {}

class ShowLoadingState extends ProfileTabStates {}

class HideDialogState extends ProfileTabStates {}

class QuestionDialogState extends ProfileTabStates {}

class ProfileTabState {
  late ProfileTabStates userProfileState;
  late ProfileTabStates navigationState;

  ProfileTabState() {
    userProfileState = ProfileInitialState();
    navigationState = ProfileInitialState();
  }

  ProfileTabState copyWith({
    ProfileTabStates? userProfileState,
    ProfileTabStates? navigationState,
  }) {
    return ProfileTabState()
      ..userProfileState = userProfileState ?? this.userProfileState
      ..navigationState = navigationState ?? this.navigationState;
  }
}
