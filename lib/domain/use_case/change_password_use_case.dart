// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/change_password/change_password_reaponse.dart';
import 'package:ecommerce_elevate/domain/entities/change_password/change_password_request.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';

@injectable
class ChangePasswordUseCase {
  final AuthRepository _authRepository;

  ChangePasswordUseCase(this._authRepository);

  Future<Results<ChangePasswordResponse?>> call(
    String token,
    ChangePasswordRequest request,
  ) async =>
      await _authRepository.changePassword(token, request);
}
