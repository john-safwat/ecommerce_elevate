// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/domain/repository/categories_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesListUseCase {
  CategoriesRepository repository;

  GetCategoriesListUseCase(this.repository);

  Future<Results<List<Category>?>> call() async =>
      repository.getCategoriesList();
}
