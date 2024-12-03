// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_user.dart';
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class SignupUserUseCase {
  final AuthRepository _repository;

  const SignupUserUseCase(this._repository);

  Future<Results<RegistrationResponse>> call(RegistrationUser user) async =>
      await _repository.signup(user);
}
