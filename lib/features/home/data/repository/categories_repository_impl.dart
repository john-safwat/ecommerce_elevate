import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_datasource.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/occasions_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/cateogry/Categories.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/categories_repository.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/occasions_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:CategoriesRepository )
class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesDatasource _datasource;

  CategoriesRepositoryImpl(this._datasource);

  @override
  Future<Results<List<Categories>?>> getCategoriesList() async{
    var response = await _datasource.getCategoriesList();
    return response;
  }



}