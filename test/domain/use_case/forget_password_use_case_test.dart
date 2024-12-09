import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_elevate/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/di/di_test.dart';
import 'forget_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepositoryImpl])
void main() {
  late AuthRepositoryImpl repository;
  getItTest.registerSingleton<MockAuthRepositoryImpl>(MockAuthRepositoryImpl());
  setUp(() {
    repository = getItTest<MockAuthRepositoryImpl>();
  });

  group("Test Forget Password Function Class From Auth Repo", () {
    test("if the function return a failure ", () async {
      // Assert
      MockAuthRepositoryImpl authRemoteDatasourceImpl =
          getItTest<MockAuthRepositoryImpl>();
      var results = Failure<ForgetPasswordResponse>(ServerError("", 404));
      provideDummy<Results<ForgetPasswordResponse>>(results);

      // Act
      when(authRemoteDatasourceImpl.forgetPassword(any))
          .thenAnswer((_) async => results);
      var actual = await repository.forgetPassword("email");

      // Assert
      expect(actual, isA<Failure<ForgetPasswordResponse>>());
      expect(actual, results);
    });
    test("if the function return a success ", () async {
      // Assert
      MockAuthRepositoryImpl authRemoteDatasourceImpl =
          getItTest<MockAuthRepositoryImpl>();
      var results = Success<ForgetPasswordResponse>(null);
      provideDummy<Results<ForgetPasswordResponse>>(results);

      // Act
      when(authRemoteDatasourceImpl.forgetPassword(any))
          .thenAnswer((_) async => results);
      var actual = await repository.forgetPassword("email");

      // Assert
      expect(actual, isA<Success<ForgetPasswordResponse>>());
      expect(actual, results);
    });
  });
}
