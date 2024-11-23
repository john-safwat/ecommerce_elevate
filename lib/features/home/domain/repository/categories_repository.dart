// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';

abstract interface class CategoriesRepository {
  Future<Results<List<Category>?>> getCategoriesList();
}
