// 📦 Package imports:
import 'package:ecommerce_elevate/features/home/data/datasource/contract/logged_user_info_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/logged_user_info_repository.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/categories_repository.dart';

@Injectable(as: LoggedUserInfoRepository)
class LoggedUserInfoRepositoryImpl implements LoggedUserInfoRepository {
  final LoggedUserInfoRemoteDatasource _datasource;

  LoggedUserInfoRepositoryImpl(this._datasource);

  @override
  Future<Results<ProfileResponse?>> getLoggedUserInfo(String token)async {
    var response = await _datasource.getLoggedUserInfo(token);
    return response;
  }


}
