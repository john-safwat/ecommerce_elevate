import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_local_datasource.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_remote_datasource.dart';
import 'package:ecommerce_elevate/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthRemoteDatasource, AuthLocalDatasource])
void main() {
  group('when call dataSource it should return state', (){
    test('when call dataSource it should return Success state', ()async {
      var remoteDataSource = MockAuthRemoteDatasource();
      var localDataSource = MockAuthLocalDatasource();
      var authRepo = AuthRepositoryImpl(remoteDataSource, localDataSource);
      var resetCode = '9098';
      var result = Success<VerifyResetCodeResponse>(VerifyResetCodeResponse());
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(remoteDataSource.verifyResetCode(resetCode)).thenAnswer(
            (_) async => result ,);
      var actual = await authRepo.verifyResetCode(resetCode);
      verify(remoteDataSource.verifyResetCode(resetCode));
      expect(actual, result);
    });
    test('when call dataSource it should return Fail state with exception', ()async {
      var remoteDataSource = MockAuthRemoteDatasource();
      var localDataSource = MockAuthLocalDatasource();
      var authRepo = AuthRepositoryImpl(remoteDataSource, localDataSource);
      var resetCode = '9098';
      var result = Failure<VerifyResetCodeResponse>(Exception());
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(remoteDataSource.verifyResetCode(resetCode)).thenAnswer(
            (_) async => result ,);
      var actual = await authRepo.verifyResetCode(resetCode);
      verify(remoteDataSource.verifyResetCode(resetCode));
      expect(actual, result);
    });
    test('when call dataSource it should return Fail state with timeOut Exception', ()async {
      var remoteDataSource = MockAuthRemoteDatasource();
      var localDataSource = MockAuthLocalDatasource();
      var authRepo = AuthRepositoryImpl(remoteDataSource, localDataSource);
      var resetCode = '9098';
      var result = Failure<VerifyResetCodeResponse>(TimeoutException('time out'));
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(remoteDataSource.verifyResetCode(resetCode)).thenAnswer(
            (_) async => result ,);
      var actual = await authRepo.verifyResetCode(resetCode);
      verify(remoteDataSource.verifyResetCode(resetCode));
      expect(actual, result);
    });
    test('when call dataSource it should return Fail state with dio exception', ()async {
      var remoteDataSource = MockAuthRemoteDatasource();
      var localDataSource = MockAuthLocalDatasource();
      var authRepo = AuthRepositoryImpl(remoteDataSource, localDataSource);
      var resetCode = '9098';
      var result = Failure<VerifyResetCodeResponse>(DioException(requestOptions: RequestOptions()));
      provideDummy<Results<VerifyResetCodeResponse>>(result);
      when(remoteDataSource.verifyResetCode(resetCode)).thenAnswer(
            (_) async => result ,);
      var actual = await authRepo.verifyResetCode(resetCode);
      verify(remoteDataSource.verifyResetCode(resetCode));
      expect(actual, result);
    });


  });

}
