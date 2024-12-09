// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/logout/logout_response.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

import '../repository/logout_repository.dart';

@injectable
class LogoutUserUseCase {
  LogoutRepository repository;

  LogoutUserUseCase(this.repository);

  Future<Results<LogoutResponse?>> call(String token) async =>
      repository.logoutUser(token);
}
