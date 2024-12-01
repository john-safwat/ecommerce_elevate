import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/change_password/change_password_reaponse.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/change_password/change_password_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/change_password_use_case.dart';
import 'package:ecommerce_elevate/features/auth/presentation/change_password/change_password_contract.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordViewModel
    extends BaseViewModel<ChangePasswordViewState, ChangePasswordViewAction> {
  ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordViewModel(this.changePasswordUseCase)
      : super(InitialChangePasswordViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ValueNotifier<bool> valid = ValueNotifier(false);
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> newPasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> passwordConfirmationVisible = ValueNotifier(true);

  @override
  Future<void> doIntent(ChangePasswordViewAction action) async {
    switch (action) {
      case ChangePasswordVisibilityAction():
        {
          _changePasswordVisibility();
        }
      case ChangeNewPasswordVisibilityAction():
        {
          _changeNewPasswordVisibility();
        }
      case ChangePasswordConfirmationVisibilityAction():
        {
          _changePasswordConfirmationVisibility();
        }
      case FormValidationAction():
        {
          _validate();
        }
      case ChangePasswordAction():
        {
          _changePassword();
        }
      case NavigateToHomeScreeAction():
        {
          _navigateToHomeScreen();
        }
    }
  }

  // validate the password is not less than 8 chars
  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return locale!.passwordCantBeEmpty;
    } else if (input.length < 8) {
      return locale!.invalidPasswordLength;
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
        .hasMatch(input)) {
      return locale!.invalidPasswordPattern;
    }
    return null;
  }

  // validate the password confirmation is not empty and the same as the password
  String? passwordConfirmationValidation(String input) {
    if (input.isEmpty) {
      return locale!.passwordCantBeEmpty;
    } else if (input != newPasswordController.text) {
      return locale!.passwordDoseNotMatch;
    }
    return null;
  }

  void _changePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void _changeNewPasswordVisibility() {
    newPasswordVisible.value = !newPasswordVisible.value;
  }

  void _changePasswordConfirmationVisibility() {
    passwordConfirmationVisible.value = !passwordConfirmationVisible.value;
  }

  void _validate() {
    if (newPasswordController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _changePassword() async {
    if (!valid.value) {
      return;
    }
    if (formKey.currentState!.validate()) {
      emit(ShowLoadingState());
      var response = await changePasswordUseCase(
          'Bearer ${appConfigProvider!.token}',
          ChangePasswordRequest(
            newPassword: newPasswordController.text,
            password: passwordController.text,
          ));
      emit(HideLoadingState());
      switch (response) {
        case Success<ChangePasswordReaponse?>():
          {
            if (response.data!.token != null) {
              appConfigProvider!.token = response.data!.token ?? "";
              emit(ShowSuccessState());
            }
          }

        case Failure<ChangePasswordReaponse?>():
          {
            emit(ShowFailState(mapExceptionToMessage(response.exception)));
          }
      }
    }
  }

  void _navigateToHomeScreen() {
    emit(HideLoadingState());
  }
}
