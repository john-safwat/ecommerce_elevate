// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/domain/repository/categories_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

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
