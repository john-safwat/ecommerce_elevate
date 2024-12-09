// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
import 'package:ecommerce_elevate/domain/use_case/verify_reset_code_use_case.dart';
// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'verify_reset_code_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  test(
      'when call invoke it should call authRepository.verifyResetPasswordCode with correct params ',
      () {
    var authRepo = MockAuthRepository();
    var useCase = VerifyResetPasswordUseCase(authRepo);
    String resetCode = '98367';
    var mockedResult =
        Success<VerifyResetCodeResponse>(VerifyResetCodeResponse());
    provideDummy<Results<VerifyResetCodeResponse>>(mockedResult);
    when(authRepo.verifyResetCode(resetCode)).thenAnswer(
      (_) async => mockedResult,
    );
    useCase.call(resetCode: resetCode);
    verify(authRepo.verifyResetCode(resetCode));
  });
}
