// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/logout/logout_response.dart';

abstract interface class LogoutRemoteDatasource {
  Future<Results<LogoutResponse?>> logoutUser(String token);
}
