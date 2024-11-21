import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/cateogry/Categories.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/datasource_execution/datasource_execution.dart';
import '../../api/categories/categories_retrofit_client.dart';

@Injectable(as: CategoriesDatasource)
class CategoriesDatasourceImpl extends CategoriesDatasource {
  final CategoriesRetrofitClient _categoriesRetrofitClient;
  final DataSourceExecution _apiExecution;

  CategoriesDatasourceImpl(this._categoriesRetrofitClient, this._apiExecution);

  @override
  Future<Results<List<Categories>?>> getCategoriesList()async {
    var response = await _apiExecution.execute<List<Categories>?>(() async {
      var result = await _categoriesRetrofitClient.getCategoriesList();
      var occasions = result.categories?.map((e) => e.toDomain(),).toList();
      return occasions;
    });
    return response;
  }


}
