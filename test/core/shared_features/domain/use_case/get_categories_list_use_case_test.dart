// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/categories_repository.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/get_categories_list_use_case.dart';
import '../../../../core/di/di_test.dart';
import 'get_categories_list_use_case_test.mocks.dart';

@GenerateMocks([CategoriesRepository])
void main() async {
  await dependenciesSetup();

  group("Categories Repository Test", () {
    test('should return a non-empty categories list on successful repo call',
        () async {
      var mockRepository = getItTest<MockCategoriesRepository>();
      var useCase = GetCategoriesListUseCase(mockRepository);

      final mockCategories = [
        Category(id: '1', name: 'Electronics'),
        Category(id: '2', name: 'Clothing'),
      ];

      var result = Success<List<Category>?>(mockCategories);
      provideDummy<Results<List<Category>?>>(result);
      when(mockRepository.getCategoriesList()).thenAnswer((_) async => result);
      final actualResult = await useCase();

      expect(actualResult, result);
      expect(result.data, isNotNull);
      expect(result.data!.length, equals(2));
      expect(result.data![0].name, equals('Electronics'));
    });

    test('Failure during the API call.', () async {
      var mockRepository = getItTest<MockCategoriesRepository>();
      var useCase = GetCategoriesListUseCase(mockRepository);

      var result = Failure<List<Category>?>(Exception());
      provideDummy<Results<List<Category>?>>(result);
      when(mockRepository.getCategoriesList()).thenAnswer((_) async => result);

      final actualResult = await useCase();

      expect(actualResult, result);
      expect(result.exception, isException);
    });
  });
}
