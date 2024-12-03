// 📦 Package imports:
import 'package:ecommerce_elevate/features/home/domain/entities/logout/logout_response.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

import '../repository/logout_repository.dart';

@injectable
class LogoutUserUseCase {
  LogoutRepository repository;

  LogoutUserUseCase(this.repository);

  Future<Results<LogoutResponse?>> call(String token) async => repository.logoutUser(token);
}
