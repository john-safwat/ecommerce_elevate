import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUserUseCase {
  final AuthRepository _authRepository;

  const LoginUserUseCase(this._authRepository);

  Future<Results<AuthenticationResponse>> call(
          AuthenticationRequest auth, bool saveUser) async =>
      await _authRepository.signIn(auth, saveUser);
}
