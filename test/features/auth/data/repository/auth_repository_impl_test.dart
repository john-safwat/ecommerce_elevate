import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_local_datasource.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_remote_datasource.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:ecommerce_elevate/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDatasource, AuthLocalDatasource])
void main() {
  provideDummy<Results<AuthenticationResponse>>(
    Success<AuthenticationResponse>(null),
  );
  late MockAuthRemoteDatasource mockRemoteDatasource;
  late MockAuthLocalDatasource mockLocalDatasource;
  late AuthRepository authRepository;

  setUp(() {
    mockRemoteDatasource = MockAuthRemoteDatasource();
    mockLocalDatasource = MockAuthLocalDatasource();
    authRepository =
        AuthRepositoryImpl(mockRemoteDatasource, mockLocalDatasource);
  });

  group('Sign In', () {
    final testAuthRequest = AuthenticationRequest(
      email: "test@example.com",
      password: "Password123",
    );
    final testAuthResponse = AuthenticationResponse(
      message: "Login successful",
      token: "token_123",
      code: 200,
    );

    test('should sign in successfully and save token when saveUser is true',
        () async {
      when(mockRemoteDatasource.signIn(testAuthRequest))
          .thenAnswer((_) async => Success(testAuthResponse));

      when(mockLocalDatasource.storeToken(any)).thenAnswer((_) async {});
      final result = await authRepository.signIn(testAuthRequest, true);

      expect(result, isA<Success<AuthenticationResponse>>());
      verify(mockRemoteDatasource.signIn(testAuthRequest)).called(1);
      verify(mockLocalDatasource.storeToken(testAuthResponse.token ?? ""))
          .called(1);
    });

    test(
        'should sign in successfully and NOT save token when saveUser is false',
        () async {
      when(mockRemoteDatasource.signIn(testAuthRequest))
          .thenAnswer((_) async => Success(testAuthResponse));

      final result = await authRepository.signIn(testAuthRequest, false);

      expect(result, isA<Success<AuthenticationResponse>>());
      verify(mockRemoteDatasource.signIn(testAuthRequest)).called(1);
      verifyNever(mockLocalDatasource.storeToken(any));
    });

    test('should return failure when sign in fails', () async {
      when(mockRemoteDatasource.signIn(testAuthRequest))
          .thenAnswer((_) async => Failure(Exception("Invalid credentials")));

      final result = await authRepository.signIn(testAuthRequest, true);

      expect(result, isA<Failure<AuthenticationResponse>>());
      verify(mockRemoteDatasource.signIn(testAuthRequest)).called(1);
      verifyNever(mockLocalDatasource.storeToken(any));
    });
  });
}
