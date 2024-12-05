// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/domain/use_case/change_password_use_case.dart';
import 'package:ecommerce_elevate/features/change_password/change_password_contract.dart';
import 'package:ecommerce_elevate/features/change_password/change_password_view_model.dart';
import 'change_password_view_model_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late ChangePasswordUseCase changePasswordUseCase;
  late ChangePasswordViewModel changePasswordViewModel;
  AppLocalizations locale =
      await AppLocalizations.delegate.load(const Locale('en'));
  setUp(() {
    changePasswordUseCase = MockChangePasswordUseCase();
    changePasswordViewModel = ChangePasswordViewModel(changePasswordUseCase);
    changePasswordViewModel.locale = locale;
  });

  group('password validation', () {
    test('empty String', () {
      String? result = changePasswordViewModel.passwordValidation('');
      expect(result, changePasswordViewModel.locale!.passwordCantBeEmpty);
    });
    test('input length less than 8', () {
      String? result = changePasswordViewModel.passwordValidation('12345');
      expect(result, changePasswordViewModel.locale!.invalidPasswordLength);
    });

    test('check password pattern', () {
      String? result = changePasswordViewModel.passwordValidation('12345678');
      expect(result, changePasswordViewModel.locale!.invalidPasswordPattern);
    });
  });
  group('passwor Confirmation Validation', () {
    test('empty String', () {
      String? result = changePasswordViewModel.passwordValidation('');
      expect(result, changePasswordViewModel.locale!.passwordCantBeEmpty);
    });
    test('input != passwordController.text', () {
      changePasswordViewModel.passwordController.text = '12345678';
      String? result =
          changePasswordViewModel.passwordConfirmationValidation('12345');

      expect(result, changePasswordViewModel.locale!.passwordDoseNotMatch);
    });

    test('check password pattern', () {
      String? result = changePasswordViewModel.passwordValidation('12345678');
      expect(result, changePasswordViewModel.locale!.invalidPasswordPattern);
    });
  });

  group('when call any Action call method depend on this Action', () {
    test(
        'when call ChangePasswordVisibilityAction should call ChangePasswordVisibility()',
        () {
      changePasswordViewModel.passwordVisible.value = true;
      changePasswordViewModel.doIntent(ChangePasswordVisibilityAction());

      expect(changePasswordViewModel.passwordVisible.value, false);
    });
    test(
        'when call ChangeNewPasswordVisibilityAction should call _changeNewPasswordVisibility()',
        () {
      changePasswordViewModel.newPasswordVisible.value = true;
      changePasswordViewModel.doIntent(ChangeNewPasswordVisibilityAction());

      expect(changePasswordViewModel.newPasswordVisible.value, false);
    });
    test(
        'when call ChangePasswordConfirmationVisibilityAction should call _changePasswordConfirmationVisibility()',
        () {
      changePasswordViewModel.passwordConfirmationVisible.value = true;
      changePasswordViewModel
          .doIntent(ChangePasswordConfirmationVisibilityAction());

      expect(changePasswordViewModel.passwordConfirmationVisible.value, false);
    });
    test(
        'when call NavigateToHomeScreeAction should call _navigateToHomeScreen()',
        () {
      changePasswordViewModel.doIntent(NavigateToHomeScreeAction());
      expect(changePasswordViewModel.state, isA<HideLoadingState>());
    });
    test('when call ChangePasswordAction should call _changePassword()', () {
      //todo : mock form key
    });
  });
  group('when call FormValidationAction should call _validate()', () {
    test('valid equal false when controller empty', () {
      changePasswordViewModel.passwordController.text = '';
      changePasswordViewModel.newPasswordController.text = '';
      changePasswordViewModel.confirmPasswordController.text = '';
      changePasswordViewModel.doIntent(FormValidationAction());
      expect(changePasswordViewModel.valid.value, false);
    });
  });
}
