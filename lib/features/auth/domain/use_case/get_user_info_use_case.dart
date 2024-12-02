import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetUserInfoUseCase {
  final AuthRepository _authRepository;

  GetUserInfoUseCase(this._authRepository);
}
