// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository _authRepository;

  const ResetPasswordUseCase(this._authRepository);

  Future<Results<ResetPasswordResponse>> call(
          ResetPasswordRequest request) async =>
      await _authRepository.resetPassword(request);
}
