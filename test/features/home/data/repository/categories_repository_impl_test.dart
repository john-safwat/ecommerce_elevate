import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/data/repository/categories_repository_impl.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/di_test.dart';
import 'categories_repository_impl_test.mocks.dart';

@GenerateMocks([CategoriesRemoteDatasource])
void main() async {

  await dependenciesSetup();

  group("Categories Repository Test", () {
    test('should return a non-empty categories list on successful datasource call', () async {
      var mockDatasource = getItTest<MockCategoriesRemoteDatasource>();
      var repository = CategoriesRepositoryImpl(mockDatasource);

      final mockCategories = [
        Category(id: '1', name: 'Electronics'),
        Category(id: '2', name: 'Clothing'),
      ];

      var result = Success<List<Category>?>(mockCategories);
      provideDummy<Results<List<Category>?>>(result);
      when(mockDatasource.getCategoriesList()).thenAnswer((_) async => result);
      final actualResult = await repository.getCategoriesList();

      expect(actualResult, result);
      expect(result.data, isNotNull);
      expect(result.data!.length, equals(2));
      expect(result.data![0].name, equals('Electronics'));
    });

    test('Failure during the API call.', () async {
      var mockDatasource = getItTest<MockCategoriesRemoteDatasource>();
      var repository = CategoriesRepositoryImpl(mockDatasource);

      var result = Failure<List<Category>?>(Exception());
      provideDummy<Results<List<Category>?>>(result);
      when(mockDatasource.getCategoriesList()).thenAnswer((_) async => result);

      final actualResult = await repository.getCategoriesList();

      expect(actualResult, result);
      expect(result.exception, isException);
    });

  });

}