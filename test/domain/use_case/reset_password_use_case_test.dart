import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_elevate/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/domain/use_case/reset_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/di/di_test.dart';
import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepositoryImpl])
void main() {

  late ResetPasswordUseCase useCase;
  getItTest.registerSingleton<MockAuthRepositoryImpl>(MockAuthRepositoryImpl());
  setUp(() {
    useCase = ResetPasswordUseCase(getItTest<MockAuthRepositoryImpl>());
  });

  group("Test Forget Password Function Class From Auth Repo", (){
    test("if the function return a failure ", ()async{
      // Assert
      MockAuthRepositoryImpl repositoryImpl = getItTest<MockAuthRepositoryImpl>();
      var results = Failure<ResetPasswordResponse>(ServerError("",404));
      provideDummy<Results<ResetPasswordResponse>>(results);

      // Act
      when(repositoryImpl.resetPassword(any)).thenAnswer((_)async => results);
      var actual = await useCase(ResetPasswordRequest());

      // Assert
      expect(actual, isA<Failure<ResetPasswordResponse>>());
      expect(actual, results);

    });
    test("if the function return a Success ", ()async{
      // Assert
      MockAuthRepositoryImpl repositoryImpl = getItTest<MockAuthRepositoryImpl>();
      var results = Success<ResetPasswordResponse>(null);
      provideDummy<Results<ResetPasswordResponse>>(results);

      // Act
      when(repositoryImpl.resetPassword(any)).thenAnswer((_)async => results);
      var actual = await useCase(ResetPasswordRequest());

      // Assert
      expect(actual, isA<Success<ResetPasswordResponse>>());
      expect(actual, results);

    });
  });
}