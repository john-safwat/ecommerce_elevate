import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
import 'package:ecommerce_elevate/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_contract.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_view.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

import '../../core/datasource_execution/mock_shared_prefrences.dart';
import '../../core/di/di_test.dart';
import 'forget_password_view_model_test.mocks.dart';

@GenerateMocks([ForgetPasswordUseCase])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dependenciesSetup();
  late ForgetPasswordViewModel viewModel;
  group("Testing Email Validation Function", () {
    setUp(() {
      viewModel = ForgetPasswordViewModel(
        MockForgetPasswordUseCase(),
      )..locale = getItTest<AppLocalizations>();
    });
    test("case if function called while the input is empty", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.emailValidation("");
      // Assert
      expect(result, viewModel.locale!.emailCantBeEmpty);
    });

    test("case if function called while the input email is invalid email", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.emailValidation("john@ddd..");
      // Assert
      expect(result, viewModel.locale!.enterAValidEmail);
    });

    test("case if function called while the input email is valid email", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.emailValidation("john@route.com");
      // Assert
      expect(result, isNull);
    });
  });
  group("Testing Update Validation State", () {
    setUp(() {
      viewModel = getItTest<ForgetPasswordViewModel>();
    });
    test("Email Controller is empty", () {
      // Arrange
      viewModel.emailController.text = "";
      // Act
      viewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(viewModel.valid.value, false);
    });

    testWidgets("Form key validation have invalid input in email controller",
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
            home: const ForgetPasswordView(),
          ),
        ),
      );
      viewModel.emailController.text = "john@ddd..";

      // Act
      viewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(viewModel.valid.value, false);
    });

    testWidgets("Form key validation have valid input in email controller",
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
            home: const ForgetPasswordView(),
          ),
        ),
      );
      viewModel.emailController.text = "john@route.con";

      // Act
      viewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(viewModel.valid.value, true);
    });
  });
  group("Testing Navigate To OTP Screen Function", () {
    setUp(() {
      viewModel = ForgetPasswordViewModel(
        MockForgetPasswordUseCase(),
      )..locale = getItTest<AppLocalizations>();
    });
    test("case of calling the navigateToOTPScreen function", () {
      // Arrange
      String email = "john@route.com";
      viewModel.appConfigProvider = AppConfigProvider();
      viewModel.emailController.text = email;
      // Act
      viewModel.doIntent(NavigateToOtpScreenAction());
      // Assert
      expect(viewModel.state, isA<NavigateToOtpScreenState>());
      expect(viewModel.appConfigProvider!.email, equals(email));
    });
  });
}
