// 📦 Package imports:

// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';

// 📦 Package imports:

@injectable
class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  const ResetPasswordUseCase(this._authRepository);

  Future<Results<ResetPasswordResponse>> call(
          ResetPasswordRequest request) async =>
      await _authRepository.resetPassword(request);
}
