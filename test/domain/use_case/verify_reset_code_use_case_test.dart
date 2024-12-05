// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
import 'package:ecommerce_elevate/domain/use_case/verify_reset_code_use_case.dart';
import '../../features/domain/verify_reset_code_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  group(
      'when call (call function) it should call authRepository.verifyResetPasswordCode with correct params ',
      () {
    test(
        'when call (call function) with correct params it should return success ',
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
    test(
        'when call (call function) with incorrect params it should return fail with exception',
        () {
      var authRepo = MockAuthRepository();
      var useCase = VerifyResetPasswordUseCase(authRepo);
      String resetCode = '9898';
      var mockedResult = Failure<VerifyResetCodeResponse>(Exception());
      provideDummy<Results<VerifyResetCodeResponse>>(mockedResult);
      when(authRepo.verifyResetCode(resetCode)).thenAnswer(
        (_) async => mockedResult,
      );
      useCase.call(resetCode: resetCode);
      verify(authRepo.verifyResetCode(resetCode));
    });
    test(
        'when call (call function) with incorrect params it should return fail with timOut Exception',
        () {
      var authRepo = MockAuthRepository();
      var useCase = VerifyResetPasswordUseCase(authRepo);
      String resetCode = '9898';
      var mockedResult = Failure<VerifyResetCodeResponse>(TimeoutException(''));
      provideDummy<Results<VerifyResetCodeResponse>>(mockedResult);
      when(authRepo.verifyResetCode(resetCode)).thenAnswer(
        (_) async => mockedResult,
      );
      useCase.call(resetCode: resetCode);
      verify(authRepo.verifyResetCode(resetCode));
    });
    test(
        'when call (call function) with incorrect params it should return fail with Dio Exception',
        () {
      var authRepo = MockAuthRepository();
      var useCase = VerifyResetPasswordUseCase(authRepo);
      String resetCode = '9898';
      var mockedResult = Failure<VerifyResetCodeResponse>(
          DioException(requestOptions: RequestOptions()));
      provideDummy<Results<VerifyResetCodeResponse>>(mockedResult);
      when(authRepo.verifyResetCode(resetCode)).thenAnswer(
        (_) async => mockedResult,
      );
      useCase.call(resetCode: resetCode);
      verify(authRepo.verifyResetCode(resetCode));
    });
  });
}
