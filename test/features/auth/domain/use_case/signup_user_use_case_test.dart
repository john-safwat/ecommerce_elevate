import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_user.dart';
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/signup_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_user_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  test('when call invoke it should call authRepo.signup', () async {
    var authRepository = MockAuthRepository();
    var signupUserUseCase = SignupUserUseCase(authRepository);
    var userRequest = RegistrationUser(
      email: "email",
      firstName: "firstName",
      lastName: "lastName",
      gender: "gender",
      password: "password",
      rePassword: "rePassword",
      phone: "phone",
    );
    var mockedResult = Success<RegistrationResponse>(RegistrationResponse());
    provideDummy<Results<RegistrationResponse>>(mockedResult);

    when(authRepository.signup(userRequest)).thenAnswer(
      (_) async => mockedResult,
    );

    var result = await signupUserUseCase.call(userRequest);
    expect(result, mockedResult);

    verify(authRepository.signup(userRequest));
  });
}
