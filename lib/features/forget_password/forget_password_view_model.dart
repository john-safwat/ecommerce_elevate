// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_contract.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordViewModel
    extends BaseViewModel<ForgetPasswordViewState, ForgetPasswordAction> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordViewModel(this._forgetPasswordUseCase)
      : super(InitialForgetPasswordViewState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  ValueNotifier<bool> valid = ValueNotifier(false);

  String? emailValidation(String input) {
    if (input.isEmpty) {
      return locale!.emailCantBeEmpty;
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
            r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return locale!.enterAValidEmail;
    }
    return null;
  }

  @override
  Future<void> doIntent(ForgetPasswordViewAction action) async {
    switch (action) {
      case FormDataChangedAction():
        {
          await _updateValidationState();
        }
      case ForgetPasswordAction():
        {
          await _forgetPassword();
        }
      case NavigateToOtpScreenAction():
        {
          await _navigateToOtpScreen();
        }
    }
  }

  Future<void> _forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ForgetPasswordLoadingState());
      var response = await _forgetPasswordUseCase(email: emailController.text);
      emit(HideLoadingState());
      switch (response) {
        case Success<ForgetPasswordResponse>():
          {
            emit(ForgetPasswordSuccessState());
          }
        case Failure<ForgetPasswordResponse>():
          {
            emit(ForgetPasswordFailState(
                mapExceptionToMessage(response.exception)));
          }
      }
    }
  }

  Future<void> _updateValidationState() async {
    if (emailController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  Future<void> _navigateToOtpScreen() async {
    appConfigProvider!.email = emailController.text;
    emit(NavigateToOtpScreenState());
  }
}
