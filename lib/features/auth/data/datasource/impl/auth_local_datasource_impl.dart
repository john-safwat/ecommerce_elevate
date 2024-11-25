// 📦 Package imports:
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/constants.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_local_datasource.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> storeToken(String token) async {
    await sharedPreferences.setString(Constants.tokenKey, token);
  }

  @override
  Future<void> deleteToken() async {
    await sharedPreferences.remove(Constants.tokenKey);
  }
}
