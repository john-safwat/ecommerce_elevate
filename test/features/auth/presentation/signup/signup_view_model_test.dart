// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_user.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/signup_user_use_case.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_view_model_test.mocks.dart';

@GenerateMocks([SignupUserUseCase , GlobalKey  , FormState])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SignupUserUseCase signupUseCase;
  late SignupViewModel signupViewModel;
  late RegistrationUser user;
  AppLocalizations locale =
  await AppLocalizations.delegate.load(const Locale('en'));

  setUp(() {
    signupUseCase = MockSignupUserUseCase();
    signupViewModel = SignupViewModel(signupUseCase);
    signupViewModel.locale = locale;
    user = RegistrationUser(
      email: "email",
      firstName: "firstName",
      lastName: "lastName",
      gender: "gender",
      password: "password",
      rePassword: "rePassword",
      phone: "phone",
    );
  });

  group('name validation', () {
    test('should return error message if name is empty', () {
      String? result = signupViewModel.nameValidation('');
      expect(result, signupViewModel.locale!.nameCantBeEmpty);
    });
    test('shoud return error messge if name is not valid', () {
      var result = signupViewModel.nameValidation('mo#');
      expect(result, signupViewModel.locale!.invalidName);
    });
    test('nameValidation returns null for valid name', () {
      const validName = "mohamed";
      final result = signupViewModel.nameValidation(validName);
      expect(result, isNull);
    });
  });

  group('email validation', () {
    test('should return error message if email is empty', () {
      String? result = signupViewModel.emailValidation('');
      expect(result, signupViewModel.locale!.emailCantBeEmpty);
    });
    test('shoud return error messge if email is not valid', () {
      var result = signupViewModel.emailValidation('mohamed');
      expect(result, signupViewModel.locale!.enterAValidEmail);
    });
    test('emailValidation returns null for valid email', () {
      const validEmail = "mohamed@gmail.com";
      final result = signupViewModel.emailValidation(validEmail);
      expect(result, isNull);
    });
  });

  group('password validation', () {
    test('should return error message if password is empty', () {
      String? result = signupViewModel.passwordValidation('');
      expect(result, signupViewModel.locale!.passwordCantBeEmpty);
    });
    test('shoud return error messge if password is not valid', () {
      var result = signupViewModel.passwordValidation('mohamed');
      expect(result, signupViewModel.locale!.invalidPasswordLength);
    });
    test('passwordValidation returns null for valid password', () {
      const validPassword = "Ee3000##";
      final result = signupViewModel.passwordValidation(validPassword);
      expect(result, isNull);
    });
  });

  group('password confirmation validation', () {
    test('should return error message if password confirmation is empty', () {
      String? result = signupViewModel.passwordConfirmationValidation('');
      expect(result, signupViewModel.locale!.passwordCantBeEmpty);
    });
    test('shoud return error messge if password confirmation is not valid', () {
      var result = signupViewModel.passwordConfirmationValidation('mohamed');
      expect(result, signupViewModel.locale!.passwordDoseNotMatch);
    });
    test('passwordConfirmationValidation returns null for valid password', () {
      const validPassword = "Ee3000##";
      signupViewModel.passwordController.text = validPassword;
      final result =
      signupViewModel.passwordConfirmationValidation(validPassword);
      expect(result, isNull);
    });
  });

  group('phone validation', () {
    test('should return error message if phone is empty', () {
      String? result = signupViewModel.phoneValidation('');
      expect(result, signupViewModel.locale!.enterPhoneNumber);
    });
    test('shoud return error messge if phone is not valid', () {
      var result = signupViewModel.phoneValidation('25601');
      expect(result, signupViewModel.locale!.enterValidMobileNumber);
    });
    test('phoneValidation returns null for valid phone', () {
      const validPhone = "+201026489575";
      final result = signupViewModel.phoneValidation(validPhone);
      expect(result, isNull);
    });
  });

  group('do action call functions based on signup action ', () {
    test(
        'shold  call changePasswordVisibility() function based on change password visibilityAction',
            () {
          signupViewModel.passwordVisible.value = false;
          signupViewModel.doIntent(ChangePasswordVisibilityAction());
          expect(signupViewModel.passwordVisible.value, true);
        });
    test(
        'shold  call _changePasswordConfirmVisibility() function based on change passwordConfirmVisibility action',
            () {
          signupViewModel.passwordConfirmationVisible.value = false;

          signupViewModel.doIntent(
              ChangePasswordConfirmationVisibilityAction());

          expect(signupViewModel.passwordConfirmationVisible.value, true);
        });
    test(
        'shold  call _navigateToLoginScreen  function based on SignupConfirmAction',
            () {
          signupViewModel.doIntent(SignupConfirmAction());

          expect(signupViewModel.state, isA<NavigateToLoginScreenState>());
        });
    test(
        'shold  call _changeGender(action.gender)  function based on ChangeGenderAction',
            () {
          signupViewModel.doIntent(ChangeGenderAction(gender: Gender.male));

          expect(signupViewModel.selectedGender, Gender.male);
        });
    test(
        'shold  call _navigateToLoginScreen()  function based on NavigateToLoginScreenAction',
            () {
          signupViewModel.doIntent(NavigateToLoginScreenAction());
          expect(signupViewModel.state, isA<NavigateToLoginScreenState>());
        });
  });
}
