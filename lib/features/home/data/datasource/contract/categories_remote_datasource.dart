import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';

abstract class CategoriesRemoteDatasource{
  Future<Results<List<Category>?>> getCategoriesList();
}