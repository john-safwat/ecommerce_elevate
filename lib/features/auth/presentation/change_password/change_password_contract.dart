import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class ChangePasswordViewAction extends BaseAction {}

class ChangePasswordVisibilityAction extends ChangePasswordViewAction {}

class ChangeNewPasswordVisibilityAction extends ChangePasswordViewAction {}

class ChangePasswordConfirmationVisibilityAction
    extends ChangePasswordViewAction {}

class FormValidationAction extends ChangePasswordViewAction {}

class ChangePasswordAction extends ChangePasswordViewAction {}

class NavigateToHomeScreeAction extends ChangePasswordViewAction {}

//--------------------------------------------------------
sealed class ChangePasswordViewState {}

class InitialChangePasswordViewState extends ChangePasswordViewState {}

class ShowLoadingState extends ChangePasswordViewState {}

class HideLoadingState extends ChangePasswordViewState {}

class ShowSuccessState extends ChangePasswordViewState {}

class ShowFailState extends ChangePasswordViewState {
  String message;

  ShowFailState(this.message);
}
