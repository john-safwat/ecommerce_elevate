// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/logout/logout_response.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';

abstract interface class LogoutRepository {
  Future<Results<LogoutResponse?>> logoutUser(String token);
}
