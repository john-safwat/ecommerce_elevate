// 📦 Package imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/api/categories/categories_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../core/datasource_execution/mock_datasource_execution.dart';
import '../../../../../core/di/di_test.dart';

@GenerateMocks([CategoriesRetrofitClient])
void main() async {
  await dependenciesSetup();

  group("Categories Remote Datasource", () {
    test("Successful response with non-empty categories list.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var remoteDataSource = getItTest<CategoriesRemoteDatasource>();

      var result = Success<List<Category>?>([
        Category(),
        Category(),
        Category(),
      ]);
      provideDummy<Results<List<Category>?>>(result);

      when(datasourceExecution.execute<List<Category>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getCategoriesList();

      expect(actualResult, result);
    });
  });
}
