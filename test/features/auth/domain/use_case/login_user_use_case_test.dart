import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/login_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/verify_reset_code_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  provideDummy<Results<AuthenticationResponse>>(
    Success<AuthenticationResponse>(null),
  );

  group('LoginUserUseCase Tests', () {
    late MockAuthRepository authRepo;
    late LoginUserUseCase loginUseCase;

    setUpAll(() {
      authRepo = MockAuthRepository();
      loginUseCase = LoginUserUseCase(authRepo);
    });

    test(
      "should call authRepo.signIn with correct parameters and return success",
          () async {
        var email = "test@example.com";
        var password = "password123";
        var saveUser = true;
        var authRequest = AuthenticationRequest(email: email, password: password);
        var mockedResponse = Success<AuthenticationResponse>(
          AuthenticationResponse(
            message: "Login Successful",
            token: "token_123",
            code: 200,
          ),
        );

        when(authRepo.signIn(authRequest, saveUser))
            .thenAnswer((_) async => mockedResponse);

        var result = await loginUseCase.call(authRequest, saveUser);

        verify(authRepo.signIn(authRequest, saveUser)).called(1);
        expect(result, isA<Success<AuthenticationResponse>>());
        expect((result as Success).data!.token, "token_123");
      },
    );

    test(
      "should return failure when authRepo.signIn fails",
          () async {
        var email = "test@example.com";
        var password = "password123";
        var saveUser = true;
        var authRequest = AuthenticationRequest(email: email, password: password);
        var mockedResponse = Failure<AuthenticationResponse>(Exception("Invalid credentials"));

        when(authRepo.signIn(authRequest, saveUser))
            .thenAnswer((_) async => mockedResponse);

        var result = await loginUseCase.call(authRequest, saveUser);

        verify(authRepo.signIn(authRequest, saveUser)).called(1);
        expect(result, isA<Failure<AuthenticationResponse>>());
        expect((result as Failure).exception.toString(), "Exception: Invalid credentials");
      },
    );
  });
}
