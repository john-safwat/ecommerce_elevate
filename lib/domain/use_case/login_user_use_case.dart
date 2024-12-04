// 📦 Package imports:

// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';

@injectable
class LoginUserUseCase {
  final AuthRepository _authRepository;

  const LoginUserUseCase(this._authRepository);

  Future<Results<AuthenticationResponse>> call(
          AuthenticationRequest auth, bool saveUser) async =>
      await _authRepository.signIn(auth, saveUser);
}