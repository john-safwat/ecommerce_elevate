// 📦 Package imports:
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';

@injectable
class GetCategoriesListUseCase {
  CategoriesRepository repository;

  GetCategoriesListUseCase(this.repository);

  Future<Results<List<Category>?>> call() async =>
      repository.getCategoriesList();
}
