import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/data/repository/categories_repository_impl.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/categories_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/di_test.dart';
import 'categories_repository_test.mocks.dart';

@GenerateMocks([CategoriesRemoteDatasource])
void main() async {
  await dependenciesSetup();
  CategoriesRepository repository = getItTest<CategoriesRepository>();

  group("Categories Remote Datasource", () {
    test("Successful response with non-empty categories list.", () async {

      var onlineDataSource = getItTest<MockCategoriesRemoteDatasource>();

      var result = Success([Category()]);

      provideDummy<Results<List<Category>?>>(result);

      when(onlineDataSource.getCategoriesList())
          .thenAnswer((_) async => result);

      var actualResult = await repository.getCategoriesList();
      verify(repository.getCategoriesList()).called(1);

      expect(actualResult, result);
    });
  });
}
