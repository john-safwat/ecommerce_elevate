// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_local_datasource.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_remote_datasource.dart';
import 'package:ecommerce_elevate/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_user.dart';
import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthRemoteDatasource, AuthLocalDatasource])
void main() {
  test(
    ' when call AuthRepo signup it should call signup function from auth remote datasource',
    () async {
      var remoteDatasource = MockAuthRemoteDatasource();
      var localDatasource = MockAuthLocalDatasource();
      var authRepo = AuthRepositoryImpl(remoteDatasource, localDatasource);
      var registrationUser = RegistrationUser(
        email: "email",
        firstName: "firstName",
        lastName: "lastName",
        gender: "gender",
        password: "password",
        rePassword: "rePassword",
        phone: "phone",
      );
      var result = Success<RegistrationResponse>(RegistrationResponse());
      provideDummy<Results<RegistrationResponse>>(result);
      when(remoteDatasource.signup(registrationUser)).thenAnswer(
        (_) async => result,
      );
      var actual = await authRepo.signup(registrationUser);
      verify(remoteDatasource.signup(registrationUser)).called(1);

      expect(actual, result);
    },
  );
}
