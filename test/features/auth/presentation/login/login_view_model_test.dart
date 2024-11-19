import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/login_user_use_case.dart';
import 'package:ecommerce_elevate/features/auth/presentation/login/login_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/login/login_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'login_view_model_test.mocks.dart';

@GenerateMocks([LoginUserUseCase])
void main() {
  late LoginViewModel loginViewModel;
  late LoginUserUseCase loginUseCase;

  setUp(() {
     loginUseCase = MockLoginUserUseCase();
     loginViewModel = LoginViewModel(loginUseCase);
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
     provideDummy<Results<AuthenticationResponse>>(
       Success<AuthenticationResponse>(null),
     );
    when(loginUseCase.call(authRequest, saveUser)).thenAnswer(
          (_) async => mockedResponse,
    );
  },);
  blocTest<LoginViewModel,LoginViewState>(
    "when call doIntent with loginIntent it should call"
        "login from useCase and change state with the right sequence",
    build: () {
   return loginViewModel;
    },
    act: (loginViewModel) {
      loginViewModel.doIntent(LoginAction());
    },
    expect: () => [
      isA<LoginLoadingState>(),
      isA<LoginSuccessState>(),
    ],
  );

}
