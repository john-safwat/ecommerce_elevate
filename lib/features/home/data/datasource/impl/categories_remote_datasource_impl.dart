import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/datasource_execution/datasource_execution.dart';
import '../../api/categories/categories_retrofit_client.dart';

@Injectable(as: CategoriesRemoteDatasource)
class CategoriesDatasourceImpl extends CategoriesRemoteDatasource {
  final CategoriesRetrofitClient _categoriesRetrofitClient;
  final DataSourceExecution _apiExecution;

  CategoriesDatasourceImpl(this._categoriesRetrofitClient, this._apiExecution);

  @override
  Future<Results<List<Category>?>> getCategoriesList() async {
    var response = await _apiExecution.execute<List<Category>?>(() async {
      var result = await _categoriesRetrofitClient.getCategoriesList();
      return result.categories
          ?.map(
            (e) => e.toDomain(),
          )
          .toList();
    });
    return response;
  }
}