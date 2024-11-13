import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteTokenUseCase {
  AuthRepository authRepository;

  DeleteTokenUseCase(this.authRepository);

  Future<void> call() async => await authRepository.deleteToken();
}
