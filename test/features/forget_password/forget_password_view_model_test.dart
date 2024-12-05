import 'package:ecommerce_elevate/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_contract.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_view.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/di/di_test.dart';
import 'forget_password_view_model_test.mocks.dart';

@GenerateMocks([ForgetPasswordUseCase])
void main() async {
  await dependenciesSetup();
  late ForgetPasswordViewModel viewModel;
  final GetIt sl = GetIt.instance;
  sl.registerSingleton(ForgetPasswordViewModel(MockForgetPasswordUseCase()));
  setUp(() {
    viewModel = sl<ForgetPasswordViewModel>();
  });
  group("Testing Email Validation Function", () {
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
      ForgetPasswordView forgetPasswordView = const ForgetPasswordView();
      // when(forgetPasswordView.createState().initViewModel())
      //     .thenReturn(viewModel);
      // Arrange
      await tester.pumpWidget(forgetPasswordView);
      viewModel.emailController.text = "john@ddd..";
      // Act
      viewModel.doIntent(FormDataChangedAction());
      // Assert
      expect(viewModel.valid.value, false);
    });
  });
}
