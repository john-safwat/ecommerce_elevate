import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/domain/use_case/reset_password_use_case.dart';
import 'package:ecommerce_elevate/features/reset_password/reset_password_contract.dart';
import 'package:ecommerce_elevate/features/reset_password/reset_password_view.dart';
import 'package:ecommerce_elevate/features/reset_password/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../core/datasource_execution/mock_shared_prefrences.dart';
import '../../core/di/di_test.dart';
import 'reset_password_view_model_test.mocks.dart';

@GenerateMocks([ResetPasswordUseCase])
void main() async {
  getItTest.registerSingletonAsync<AppLocalizations>(
    () async => await AppLocalizations.delegate.load(
      const Locale("en"),
    ),
  );
  getItTest.registerSingleton<Locale>(const Locale("en"));
  await getItTest.isReady<AppLocalizations>();
  getItTest
      .registerSingleton<MockResetPasswordUseCase>(MockResetPasswordUseCase());
  getItTest.registerSingleton(
      ResetPasswordViewModel(getItTest<MockResetPasswordUseCase>())
        ..locale = getItTest<AppLocalizations>());
  getItTest.registerSingleton<MockSharedPreferences>(MockSharedPreferences());

  late ResetPasswordViewModel resetPasswordViewModel;
  setUp(() async {
    resetPasswordViewModel = getItTest<ResetPasswordViewModel>();
  });

  group('password validation', () {
    test('should return error message if password is empty', () {
      String? result = resetPasswordViewModel.passwordValidation('');
      expect(result, resetPasswordViewModel.locale!.passwordCantBeEmpty);
    });
    test('shoud return error messge if password is not valid', () {
      var result = resetPasswordViewModel.passwordValidation('mohamed');
      expect(result, resetPasswordViewModel.locale!.invalidPasswordLength);
    });
    test('passwordValidation returns null for valid password', () {
      const validPassword = "Ee3000##";
      final result = resetPasswordViewModel.passwordValidation(validPassword);
      expect(result, isNull);
    });
  });

  group('password confirmation validation', () {
    test('should return error message if password confirmation is empty', () {
      String? result =
          resetPasswordViewModel.passwordConfirmationValidation('');
      expect(result, resetPasswordViewModel.locale!.passwordCantBeEmpty);
    });
    test('shoud return error messge if password confirmation is not valid', () {
      var result =
          resetPasswordViewModel.passwordConfirmationValidation('mohamed');
      expect(result, resetPasswordViewModel.locale!.passwordDoseNotMatch);
    });
    test('passwordConfirmationValidation returns null for valid password', () {
      const validPassword = "Ee3000##";
      resetPasswordViewModel.passwordController.text = validPassword;
      final result =
          resetPasswordViewModel.passwordConfirmationValidation(validPassword);
      expect(result, isNull);
    });
  });

  group("Testing Update Validation State", () {
    test("Password Controller is empty", () {
      // Arrange
      resetPasswordViewModel.passwordController.text = "";
      resetPasswordViewModel.confirmPasswordController.text = "";
      // Act
      resetPasswordViewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(resetPasswordViewModel.valid.value, false);
    });

    testWidgets("Form key validation have invalid input in password controller",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const ResetPasswordView(),
          ),
        ),
      );
      resetPasswordViewModel.passwordController.text = "3123";
      resetPasswordViewModel.confirmPasswordController.text = "3123";
      // Act
      resetPasswordViewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(resetPasswordViewModel.valid.value, false);
    });

    testWidgets(
        "Form key validation have invalid input in password confirmation controller",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const ResetPasswordView(),
          ),
        ),
      );
      resetPasswordViewModel.passwordController.text = "3asd123";
      resetPasswordViewModel.confirmPasswordController.text = "3123";

      // Act
      resetPasswordViewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(resetPasswordViewModel.valid.value, false);
    });

    testWidgets(
        "Form key validation if password and password confirmation is not the same",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const ResetPasswordView(),
          ),
        ),
      );
      resetPasswordViewModel.passwordController.text = "1234";
      resetPasswordViewModel.confirmPasswordController.text = "3123";

      // Act
      resetPasswordViewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(resetPasswordViewModel.valid.value, false);
    });

    testWidgets(
        "Form key validation if password and password confirmation is the same and valid",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const ResetPasswordView(),
          ),
        ),
      );
      resetPasswordViewModel.passwordController.text = "Jo123@123";
      resetPasswordViewModel.confirmPasswordController.text = "Jo123@123";

      // Act
      resetPasswordViewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(resetPasswordViewModel.valid.value, true);
    });
  });
  group("Testing reset Password Function", () {
    setUp(() {
      getItTest.unregister<ResetPasswordViewModel>();
      getItTest.registerSingleton<ResetPasswordViewModel>(
          ResetPasswordViewModel(getItTest<MockResetPasswordUseCase>())
            ..locale = getItTest<AppLocalizations>());

      resetPasswordViewModel = getItTest<ResetPasswordViewModel>();
    });

    testWidgets(
      "test if the data is invalid before api call",
      (widgetTester) async {
        // Arrange
        await widgetTester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<LanguageProvider>(
                  create: (context) =>
                      LanguageProvider(getItTest<MockSharedPreferences>())),
              ChangeNotifierProvider<AppConfigProvider>(
                  create: (context) => AppConfigProvider()),
            ],
            child: MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: getItTest<Locale>(),
              home: const ResetPasswordView(),
            ),
          ),
        );
        resetPasswordViewModel.passwordController.text = "asddas3";
        resetPasswordViewModel.confirmPasswordController.text = "asddas3";

        // Act
        await resetPasswordViewModel.doIntent(ResetPasswordAction());

        // Assert
        expect(
            resetPasswordViewModel.state, isA<InitialResetPasswordViewState>());
      },
    );
    testWidgets(
      "test if the data of password and confirm password doesn't match before api call",
      (widgetTester) async {
        // Arrange
        await widgetTester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<LanguageProvider>(
                  create: (context) =>
                      LanguageProvider(getItTest<MockSharedPreferences>())),
              ChangeNotifierProvider<AppConfigProvider>(
                  create: (context) => AppConfigProvider()),
            ],
            child: MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: getItTest<Locale>(),
              home: const ResetPasswordView(),
            ),
          ),
        );
        resetPasswordViewModel.passwordController.text = "Jo123@123";
        resetPasswordViewModel.confirmPasswordController.text = "Jo123@1233";

        // Act
        await resetPasswordViewModel.doIntent(ResetPasswordAction());

        // Assert
        expect(
            resetPasswordViewModel.state, isA<InitialResetPasswordViewState>());
      },
    );
    testWidgets(
      "test if the data of password and confirm password match and api call fail",
      (widgetTester) async {
        // Arrange
        await widgetTester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<LanguageProvider>(
                  create: (context) =>
                      LanguageProvider(getItTest<MockSharedPreferences>())),
              ChangeNotifierProvider<AppConfigProvider>(
                  create: (context) => AppConfigProvider()),
            ],
            child: MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: getItTest<Locale>(),
              home: const ResetPasswordView(),
            ),
          ),
        );
        resetPasswordViewModel.passwordController.text = "Jo123@123";
        resetPasswordViewModel.confirmPasswordController.text = "Jo123@123";
        var useCase = getItTest<MockResetPasswordUseCase>();

        var results = Failure<ResetPasswordResponse>(ServerError("", 404));
        provideDummy<Results<ResetPasswordResponse>>(results);

        // Act
        when(useCase(any)).thenAnswer(
          (_) async => results,
        );
        await resetPasswordViewModel.doIntent(ResetPasswordAction());

        // Assert
        expect(resetPasswordViewModel.state, isA<ResetPasswordFailState>());
      },
    );
    testWidgets(
      "test if the data of password and confirm password match and api call success",
      (widgetTester) async {
        // Arrange
        await widgetTester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<LanguageProvider>(
                  create: (context) =>
                      LanguageProvider(getItTest<MockSharedPreferences>())),
              ChangeNotifierProvider<AppConfigProvider>(
                  create: (context) => AppConfigProvider()),
            ],
            child: MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: getItTest<Locale>(),
              home: const ResetPasswordView(),
            ),
          ),
        );
        resetPasswordViewModel.passwordController.text = "Jo123@123";
        resetPasswordViewModel.confirmPasswordController.text = "Jo123@123";
        var useCase = getItTest<MockResetPasswordUseCase>();

        var results = Success<ResetPasswordResponse>(null);
        provideDummy<Results<ResetPasswordResponse>>(results);

        // Act
        when(useCase(any)).thenAnswer(
          (_) async => results,
        );
        await resetPasswordViewModel.doIntent(ResetPasswordAction());

        // Assert
        expect(resetPasswordViewModel.state, isA<ResetPasswordSuccessState>());
      },
    );
  });
}
