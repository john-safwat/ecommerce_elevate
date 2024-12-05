// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/api/logout/logout_retrofit_client.dart';
import 'package:ecommerce_elevate/domain/entities/logout/logout_response.dart';
import '../../../../../core/datasource_execution/datasource_execution.dart';
import '../contract/logout_remote_datasource.dart';

@Injectable(as: LogoutRemoteDatasource)
class LogoutRemoteDatasourceImpl implements LogoutRemoteDatasource {
  final LogoutRetrofitClient _logoutRetrofitClient;
  final DataSourceExecution _apiExecution;

  LogoutRemoteDatasourceImpl(this._logoutRetrofitClient, this._apiExecution);

  @override
  Future<Results<LogoutResponse?>> logoutUser(String token) async {
    var response = await _apiExecution.execute<LogoutResponse>(() async {
      var result = await _logoutRetrofitClient.logoutUser(token: token);
      return result.toDomain();
    });
    return response;
  }
}
