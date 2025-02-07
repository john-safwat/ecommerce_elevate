// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepository _repository;

  const ForgetPasswordUseCase(this._repository);

  Future<Results<ForgetPasswordResponse>> call({required String email}) async =>
      await _repository.forgetPassword(email);
}
