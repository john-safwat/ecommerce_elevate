import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/change_password/change_password_reaponse.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/change_password/change_password_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final AuthRepository _authRepository;
  ChangePasswordUseCase(this._authRepository);

  Future<Results<ChangePasswordReaponse?>> call(
    String token,
    ChangePasswordRequest request,
  ) async =>
      await _authRepository.changePassword(token, request);
}
