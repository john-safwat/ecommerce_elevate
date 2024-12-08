import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/api/auth/auth_retrofit_client.dart';
import 'package:ecommerce_elevate/data/datasource/contract/auth_remote_datasource.dart';
import 'package:ecommerce_elevate/data/datasource/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../core/datasource_execution/mock_datasource_execution.dart';
import 'auth_remote_datasource_test.mocks.dart';

@GenerateMocks([AuthRetrofitClient])
void main() {
  group("Forget Password Calling test", () {
    test("Forget Password Calling return Fail State", () async {
      // arrange
      MockDataSourceExecution dataSourceExecution = MockDataSourceExecution();
      AuthRemoteDatasource remoteDatasourceImpl = AuthRemoteDatasourceImpl(
          MockAuthRetrofitClient(), dataSourceExecution);
      String email = "email";

      var result = Failure<ForgetPasswordResponse>(ServerError("asd", 404));

      provideDummy<Results<ForgetPasswordResponse>>(result);

      // act
      when(dataSourceExecution.execute<ForgetPasswordResponse>(any)).thenAnswer((_)async => result,);


      var actual = await remoteDatasourceImpl.forgetPassword(email);

      // assert
      expect(actual, isA<Failure<ForgetPasswordResponse>>());
      expect(actual, result);
    });

    test("Forget Password Calling return Success State", () async {
      // arrange
      MockDataSourceExecution dataSourceExecution = MockDataSourceExecution();
      AuthRemoteDatasource remoteDatasourceImpl = AuthRemoteDatasourceImpl(
          MockAuthRetrofitClient(), dataSourceExecution);
      String email = "john@route.com";

      var result = Success<ForgetPasswordResponse>(ForgetPasswordResponse());

      provideDummy<Results<ForgetPasswordResponse>>(result);

      // act
      when(dataSourceExecution.execute<ForgetPasswordResponse>(any)).thenAnswer((_)async => result,);


      var actual = await remoteDatasourceImpl.forgetPassword(email);

      // assert
      expect(actual, isA<Success<ForgetPasswordResponse>>());
      expect(actual, result);
    });
  });


  group("Reset Password Calling test", () {
    test("Reset Password Calling return Fail State", () async {
      // arrange
      MockDataSourceExecution dataSourceExecution = MockDataSourceExecution();
      AuthRemoteDatasource remoteDatasourceImpl = AuthRemoteDatasourceImpl(
          MockAuthRetrofitClient(), dataSourceExecution);

      var result = Failure<ResetPasswordResponse>(ServerError("asd", 404));

      provideDummy<Results<ResetPasswordResponse>>(result);

      // act
      when(dataSourceExecution.execute<ResetPasswordResponse>(any)).thenAnswer((_)async => result,);


      var actual = await remoteDatasourceImpl.resetPassword(ResetPasswordRequest());

      // assert
      expect(actual, isA<Failure<ResetPasswordResponse>>());
      expect(actual, result);
    });

    test("Reset Password Calling return Success State", () async {
      // arrange
      MockDataSourceExecution dataSourceExecution = MockDataSourceExecution();
      AuthRemoteDatasource remoteDatasourceImpl = AuthRemoteDatasourceImpl(
          MockAuthRetrofitClient(), dataSourceExecution);
      var result = Success<ResetPasswordResponse>(ResetPasswordResponse());

      provideDummy<Results<ResetPasswordResponse>>(result);

      // act
      when(dataSourceExecution.execute<ResetPasswordResponse>(any)).thenAnswer((_)async => result,);


      var actual = await remoteDatasourceImpl.resetPassword(ResetPasswordRequest());

      // assert
      expect(actual, isA<Success<ResetPasswordResponse>>());
      expect(actual, result);
    });
  });

}
