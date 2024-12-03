import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
// 📦 Package imports:
import 'package:ecommerce_elevate/features/auth/data/api/auth_retrofit_client.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/verify_reset_code/response/verify_reset_code_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../core/datasource_execution/mock_datasource_execution.dart';
import 'auth_remote_datasource_test.mocks.dart';

@GenerateMocks([AuthRetrofitClient, DataSourceExecution])
void main() {
  group('Verify Reset Password RemoteDataSource ', (){
    test('Successful response', () async {
      var retrofitClient = MockAuthRetrofitClient();
      var dataSourceExecution = MockDataSourceExecution();
      var remoteDataSource =
      AuthRemoteDatasourceImpl(retrofitClient, dataSourceExecution);
      var result = Success<VerifyResetCodeResponse>(
          VerifyResetCodeResponse(status: '200'));
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(dataSourceExecution.execute<VerifyResetCodeResponse>(any)).thenAnswer(
            (_) async => result,

      );
      var actualResult = await remoteDataSource.verifyResetCode('123456');
      expect(actualResult, result);

    });
    test('Fail response with Exception', () async {
      var retrofitClient = MockAuthRetrofitClient();
      var dataSourceExecution = MockDataSourceExecution();
      var remoteDataSource =
      AuthRemoteDatasourceImpl(retrofitClient, dataSourceExecution);
      var result = Failure<VerifyResetCodeResponse>(
          Exception());
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(dataSourceExecution.execute<VerifyResetCodeResponse>(any)).thenAnswer(
            (_) async => result,

      );
      var actualResult = await remoteDataSource.verifyResetCode('123456');
      expect(actualResult, result);

    });
    test('Fail response with time out exception', () async {
      var retrofitClient = MockAuthRetrofitClient();
      var dataSourceExecution = MockDataSourceExecution();
      var remoteDataSource =
      AuthRemoteDatasourceImpl(retrofitClient, dataSourceExecution);
      var result = Failure<VerifyResetCodeResponse>(
          TimeoutException('timeout'));
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(dataSourceExecution.execute<VerifyResetCodeResponse>(any)).thenAnswer(
            (_) async => result,

      );
      var actualResult = await remoteDataSource.verifyResetCode('123456');
      expect(actualResult, result);

    });
    test('Fail response with Dio Exception', () async {
      var retrofitClient = MockAuthRetrofitClient();
      var dataSourceExecution = MockDataSourceExecution();
      var remoteDataSource =
      AuthRemoteDatasourceImpl(retrofitClient, dataSourceExecution);
      var result = Failure<VerifyResetCodeResponse>(
          DioException(requestOptions: RequestOptions()));
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(dataSourceExecution.execute<VerifyResetCodeResponse>(any)).thenAnswer(
            (_) async => result,

      );
      var actualResult = await remoteDataSource.verifyResetCode('123456');
      expect(actualResult, result);

    });
  });
}
