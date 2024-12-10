// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/domain/use_case/login_user_use_case.dart';
import 'package:ecommerce_elevate/features/login/login_contract.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends BaseViewModel<LoginViewState, LoginViewAction> {
  final LoginUserUseCase _loginUserUseCase;

  LoginViewModel(this._loginUserUseCase) : super(InitialLoginViewState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> valid = ValueNotifier(false);
  ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  ValueNotifier<bool> isRememberMeChecked = ValueNotifier(false);

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

  @override
  Future<void> doIntent(LoginViewAction action) async {
    switch (action) {
      case FormDataChangedAction():
        {
          _updateValidationState();
        }
      case LoginAction():
        {
          _login();
        }
      case ChangePasswordVisibilityAction():
        {
          _changePasswordVisibility();
        }
      case NavigateToSignUpScreeAction():
        {
          _navigateToSignUpScreen();
        }
      case RememberMeButtonAction():
        {
          _changeRememberMeButton();
        }
      case NavigateToHomeScreeAction():
        {
          _navigateToHomeScreen();
        }
      case NavigateToForgetPasswordScreenAction():
        {
          _navigateToForgetPasswordScreen();
        }
      case GuestLoginAction():
        {
          _guestLogin();
        }
    }
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var response = await _loginUserUseCase(
          AuthenticationRequest(
              email: emailController.text, password: passwordController.text),
          isRememberMeChecked.value);
      emit(HideLoadingState());
      switch (response) {
        case Success<AuthenticationResponse>():
          {
            if (response.data!.token != null) {
              appConfigProvider!.token = response.data!.token ?? "";
              emit(LoginSuccessState());
            } else {
              emit(InvalidCredentialsState());
            }
          }
        case Failure<AuthenticationResponse>():
          {
            emit(LoginFailState(mapExceptionToMessage(response.exception)));
          }
      }
    }
  }

  void _updateValidationState() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _changePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void _navigateToHomeScreen() {
    emit(NavigateToHomeScreeState());
  }

  void _navigateToSignUpScreen() {
    emit(NavigateToSignUpScreeState());
  }

  void _changeRememberMeButton() {
    isRememberMeChecked.value = !isRememberMeChecked.value;
  }

  void _navigateToForgetPasswordScreen() {
    emit(NavigateToForgetPasswordScreenState());
  }

  void _guestLogin() {
    emit(LoginSuccessState());
  }
}
