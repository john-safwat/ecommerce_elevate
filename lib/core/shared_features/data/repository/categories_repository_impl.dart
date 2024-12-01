// 📦 Package imports:
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource _datasource;

  CategoriesRepositoryImpl(this._datasource);

  @override
  Future<Results<List<Category>?>> getCategoriesList() async {
    var response = await _datasource.getCategoriesList();
    return response;
  }
}
