import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';

sealed class ProfileAction extends BaseAction {}

class LoadDataAction extends ProfileAction {}

class ChangeGenderAction extends ProfileAction {
  Gender gender;

  ChangeGenderAction({required this.gender});
}

class FormDataChangedAction extends ProfileAction {}

class NavigateToChangePasswordAction extends ProfileAction {}

class UpdateUserAction extends ProfileAction {}

class ClearAction extends ProfileAction {}

sealed class ProfileViewState {}

class InitialProfileViewState extends ProfileViewState {}

class ProfileDataLoadingState extends ProfileViewState {}

class ProfileDataLoadingSuccessState extends ProfileViewState {}

class ProfileDataLoadingFailState extends ProfileViewState {
  String message;

  ProfileDataLoadingFailState(this.message);
}

class NavigateToChangePasswordState extends ProfileViewState {}

class ShowLoadingState extends ProfileViewState {}

class EditProfileChangeGenderState extends ProfileViewState {}

class HideLoadingState extends ProfileViewState {}

class ShowSuccessMessageState extends ProfileViewState {}

class ShowFailMessageState extends ProfileViewState {
  String message;

  ShowFailMessageState(this.message);
}
