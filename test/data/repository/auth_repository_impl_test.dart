import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/impl/auth_local_datasource_impl.dart';
import 'package:ecommerce_elevate/data/datasource/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_elevate/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/di/di_test.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDatasourceImpl, AuthLocalDatasourceImpl])
void main() {
  late AuthRepository repository;
  getItTest.registerSingleton<MockAuthRemoteDatasourceImpl>(MockAuthRemoteDatasourceImpl());
  getItTest.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(
      getItTest<MockAuthRemoteDatasourceImpl>(), MockAuthLocalDatasourceImpl()));
  setUp(() {
    repository = getItTest<AuthRepositoryImpl>();
  });
  group("Testing Forget Password Function", () {

    test("if the function return a failure ", ()async{
      // Assert
      MockAuthRemoteDatasourceImpl authRemoteDatasourceImpl = getItTest<MockAuthRemoteDatasourceImpl>();
      var results = Failure<ForgetPasswordResponse>(ServerError("",404));
      provideDummy<Results<ForgetPasswordResponse>>(results);

      // Act
      when(authRemoteDatasourceImpl.forgetPassword(any)).thenAnswer((_)async => results);
      var actual = await repository.forgetPassword("email");

      // Assert
      expect(actual, isA<Failure<ForgetPasswordResponse>>());
      expect(actual, results);

    });

    test("if the function return a success ", ()async{
      // Assert
      MockAuthRemoteDatasourceImpl authRemoteDatasourceImpl = getItTest<MockAuthRemoteDatasourceImpl>();
      var results = Success<ForgetPasswordResponse>(null);
      provideDummy<Results<ForgetPasswordResponse>>(results);

      // Act
      when(authRemoteDatasourceImpl.forgetPassword(any)).thenAnswer((_)async => results);
      var actual = await repository.forgetPassword("email");

      // Assert
      expect(actual, isA<Success<ForgetPasswordResponse>>());
      expect(actual, results);

    });

  });
  group("Testing Reset Password Function", () {

    test("if the function return a failure ", ()async{
      // Assert
      MockAuthRemoteDatasourceImpl authRemoteDatasourceImpl = getItTest<MockAuthRemoteDatasourceImpl>();
      var results = Failure<ResetPasswordResponse>(ServerError("",404));
      provideDummy<Results<ResetPasswordResponse>>(results);

      // Act
      when(authRemoteDatasourceImpl.resetPassword(any)).thenAnswer((_)async => results);
      var actual = await repository.resetPassword(ResetPasswordRequest());

      // Assert
      expect(actual, isA<Failure<ResetPasswordResponse>>());
      expect(actual, results);

    });

    test("if the function return a success ", ()async{
      // Assert
      MockAuthRemoteDatasourceImpl authRemoteDatasourceImpl = getItTest<MockAuthRemoteDatasourceImpl>();
      var results = Success<ResetPasswordResponse>(null);
      provideDummy<Results<ResetPasswordResponse>>(results);

      // Act
      when(authRemoteDatasourceImpl.resetPassword(any)).thenAnswer((_)async => results);
      var actual = await repository.resetPassword(ResetPasswordRequest());

      // Assert
      expect(actual, isA<Success<ResetPasswordResponse>>());
      expect(actual, results);

    });

  });

}
