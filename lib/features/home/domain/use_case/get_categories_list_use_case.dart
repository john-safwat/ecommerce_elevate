// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/categories_repository.dart';

@injectable
class GetCategoriesListUseCase {
  CategoriesRepository repository;

  GetCategoriesListUseCase(this.repository);

  Future<Results<List<Category>?>> call() async =>
      repository.getCategoriesList();
}
