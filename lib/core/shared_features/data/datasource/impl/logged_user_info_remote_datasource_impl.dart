import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/api/get_user_logged_info/get_user_logged_info_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/datasource_execution/datasource_execution.dart';
import '../contract/logged_user_info_remote_datasource.dart';

@Injectable(as: LoggedUserInfoRemoteDatasource)
class LoggedUserInfoRemoteDatasourceImpl implements LoggedUserInfoRemoteDatasource {
  final GetUserLoggedInfoRetrofitClient _getUserLoggedInfoRetrofitClient;
  final DataSourceExecution _apiExecution;

  LoggedUserInfoRemoteDatasourceImpl(this._getUserLoggedInfoRetrofitClient,
      this._apiExecution);

  @override
  Future<Results<ProfileResponse?>> getLoggedUserInfo(String token) async {
    var response = await _apiExecution.execute<ProfileResponse>(() async {
      var result = await _getUserLoggedInfoRetrofitClient.getLoggedUserInfo(
          token: token);
      return result.toDomain();
    });
    return response;
  }

}
