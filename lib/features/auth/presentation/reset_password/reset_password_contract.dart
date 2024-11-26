// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class ResetPasswordViewState {}

class InitialResetPasswordViewState extends ResetPasswordViewState {}

class HideLoadingState extends ResetPasswordViewState {}

class NavigateToLoginScreenState extends ResetPasswordViewState {}

class ResetPasswordViewLoadingState extends ResetPasswordViewState {}

class ResetPasswordSuccessState extends ResetPasswordViewState {}

class ResetPasswordFailState extends ResetPasswordViewState {
  String message;

  ResetPasswordFailState(this.message);
}

sealed class ResetPasswordViewAction extends BaseAction {}

class NavigateToLoginScreenAction extends ResetPasswordViewAction {}

class ResetPasswordAction extends ResetPasswordViewAction {}

class FormDataChangedAction extends ResetPasswordViewAction {}

class ChangePasswordVisibilityAction extends ResetPasswordViewAction {}

class ChangePasswordConfirmVisibilityAction extends ResetPasswordViewAction {}
