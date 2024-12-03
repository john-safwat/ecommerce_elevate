// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';

abstract interface class LoggedUserInfoRemoteDatasource {
  Future<Results<ProfileResponse?>> getLoggedUserInfo(String token);
}
