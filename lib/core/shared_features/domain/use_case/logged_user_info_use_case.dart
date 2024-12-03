// 📦 Package imports:
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

import '../repository/logged_user_info_repository.dart';

@injectable
class LoggedUserInfoUseCase {
  LoggedUserInfoRepository repository;

  LoggedUserInfoUseCase(this.repository);

  Future<Results<ProfileResponse?>> call(String token) async => repository.getLoggedUserInfo(token);
}
