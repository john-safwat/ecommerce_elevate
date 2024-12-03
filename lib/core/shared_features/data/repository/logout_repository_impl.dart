// 📦 Package imports:
import 'package:ecommerce_elevate/features/home/domain/entities/logout/logout_response.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

import '../../domain/repository/logout_repository.dart';
import '../datasource/contract/logout_remote_datasource.dart';

@Injectable(as: LogoutRepository)
class LogoutRepositoryImpl implements LogoutRepository {
  final LogoutRemoteDatasource _datasource;

  LogoutRepositoryImpl(this._datasource);

  @override
  Future<Results<LogoutResponse?>> logoutUser(String token) async {
    var response = await _datasource.logoutUser(token);
    return response;
  }
}
