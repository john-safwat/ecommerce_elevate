// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';

sealed class SignupViewAction extends BaseAction {}

class FormDataChangedAction extends SignupViewAction {}

class SignupAction extends SignupViewAction {}

class ChangeGenderAction extends SignupViewAction {
  Gender gender;

  ChangeGenderAction({required this.gender});
}

class ChangePasswordVisibilityAction extends SignupViewAction {}

class ChangePasswordConfirmationVisibilityAction extends SignupViewAction {}

class SignupConfirmAction extends SignupViewAction {}

class NavigateToLoginScreenAction extends SignupViewAction {}

sealed class SignupViewState {}

class InitialSignupViewState extends SignupViewState {}

class SignupLoadingState extends SignupViewState {}

class HideLoadingState extends SignupViewState {}

class SignupSuccessState extends SignupViewState {}

class NavigateToLoginScreenState extends SignupViewState {}

class SignupFailState extends SignupViewState {
  String message;

  SignupFailState(this.message);
}

class BadRequestState extends SignupViewState {}

class EmailAlreadyExistState extends SignupViewState {}

class UserNameAlreadyExistState extends SignupViewState {}

class ChangeGenderState extends SignupViewState {}
