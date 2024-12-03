// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:ecommerce_elevate/features/auth/presentation/reset_password/reset_password_contract.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordViewModel
    extends BaseViewModel<ResetPasswordViewState, ResetPasswordAction> {
  final ResetPasswordUseCase _resetPasswordUseCase;

  ResetPasswordViewModel(this._resetPasswordUseCase)
      : super(InitialResetPasswordViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ValueNotifier<bool> valid = ValueNotifier(false);
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> passwordConfirmationVisible = ValueNotifier(true);

  @override
  Future<void> doIntent(ResetPasswordViewAction action) async {
    switch (action) {
      case NavigateToLoginScreenAction():
        {
          _navigateToLoginScreen();
        }
      case ResetPasswordAction():
        {
          _resetPassword();
        }
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case ChangePasswordVisibilityAction():
        {
          _changePasswordVisibility();
        }
      case ChangePasswordConfirmVisibilityAction():
        {
          _changePasswordConfirmationVisibility();
        }
    }
  }

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
    } else if (input != passwordController.text) {
      return locale!.passwordDoseNotMatch;
    }
    return null;
  }

  void _updateValidationState() {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordViewLoadingState());
      var response = await _resetPasswordUseCase(ResetPasswordRequest(
          email: appConfigProvider!.email,
          newPassword: passwordController.text));
      emit(HideLoadingState());
      switch (response) {
        case Success<ResetPasswordResponse>():
          emit(ResetPasswordSuccessState());
        case Failure<ResetPasswordResponse>():
          emit(ResetPasswordFailState(
              mapExceptionToMessage(response.exception)));
      }
    }
  }

  void _navigateToLoginScreen() {
    emit(NavigateToLoginScreenState());
  }

  void _changePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void _changePasswordConfirmationVisibility() {
    passwordConfirmationVisible.value = !passwordConfirmationVisible.value;
  }
}
