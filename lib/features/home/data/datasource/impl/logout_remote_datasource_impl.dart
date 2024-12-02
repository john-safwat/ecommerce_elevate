import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/api/get_user_logged_info/get_user_logged_info_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/api/logout/logout_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/api/products/products_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/logout_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/products_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/logout/logout_response.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/datasource_execution/datasource_execution.dart';
import '../contract/logged_user_info_remote_datasource.dart';

@Injectable(as: LogoutRemoteDatasource)
class LogoutRemoteDatasourceImpl implements LogoutRemoteDatasource {
  final LogoutRetrofitClient _logoutRetrofitClient;
  final DataSourceExecution _apiExecution;

  LogoutRemoteDatasourceImpl(this._logoutRetrofitClient,
      this._apiExecution);

  @override
  Future<Results<LogoutResponse?>> logoutUser(String token)async {
    var response = await _apiExecution.execute<LogoutResponse>(() async {
      var result = await _logoutRetrofitClient.logoutUser(
          token: token);
      return result.toDomain();
    });
    return response;
  }


}
