// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/logout/logout_response.dart';

abstract interface class LogoutRepository {
  Future<Results<LogoutResponse?>> logoutUser(String token);
}
