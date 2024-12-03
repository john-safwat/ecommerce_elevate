// 📦 Package imports:

// 🌎 Project imports:
import 'package:injectable/injectable.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/categories_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

import '../../../datasource_execution/results.dart';

@injectable
class GetCategoriesListUseCase {
  CategoriesRepository repository;

  GetCategoriesListUseCase(this.repository);

  Future<Results<List<Category>?>> call() async =>
      repository.getCategoriesList();
}
