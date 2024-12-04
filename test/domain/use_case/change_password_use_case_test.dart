// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/change_password/change_password_reaponse.dart';
import 'package:ecommerce_elevate/domain/entities/change_password/change_password_request.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
import 'package:ecommerce_elevate/domain/use_case/change_password_use_case.dart';
import '../../features/domain/verify_reset_code_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  group('change password use case success and fail', () {
    test('when call method it should call authRepo.changePassword', () async {
      var mockedRepository = MockAuthRepository();
      var useCase = ChangePasswordUseCase(mockedRepository);
      var userRequest = ChangePasswordRequest(
        password: 'password',
        newPassword: 'rePassword',
      );
      const token = 'token';
      var mockedResult =
          Success<ChangePasswordResponse?>(ChangePasswordResponse());

      provideDummy<Results<ChangePasswordResponse?>>(mockedResult);
      when(mockedRepository.changePassword(token, userRequest))
          .thenAnswer((_) async => mockedResult);

      var result = await useCase.call(token, userRequest);

      expect(result, mockedResult);
    });

    test('should return Failure when changePassword fail', () async {
      var mockedRepository = MockAuthRepository();
      var useCase = ChangePasswordUseCase(mockedRepository);
      var userRequest = ChangePasswordRequest(
        password: 'password',
        newPassword: 'rePassword',
      );
      const token = 'token';
      var mockedResult = Failure<ChangePasswordResponse?>(Exception());
      provideDummy<Results<ChangePasswordResponse?>>(mockedResult);

      when(mockedRepository.changePassword(token, userRequest))
          .thenAnswer((_) async => mockedResult);

      var result = await useCase.call(token, userRequest);
      expect(result, mockedResult);
    });
  });
}
