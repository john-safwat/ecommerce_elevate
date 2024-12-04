// 📦 Package imports:

// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';

@injectable
class VerifyResetPasswordUseCase {
  final AuthRepository _authRepository;

  const VerifyResetPasswordUseCase(this._authRepository);

  Future<Results<VerifyResetCodeResponse>> call(
          {required String resetCode}) async =>
      await _authRepository.verifyResetCode(resetCode);
}
