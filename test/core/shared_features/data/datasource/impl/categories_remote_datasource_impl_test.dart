// 📦 Package imports:

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/shared_features/data/api/categories/categories_retrofit_client.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/impl/categories_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import '../../../../../core/datasource_execution/mock_datasource_execution.dart';
import '../../../../../core/di/di_test.dart';
import 'categories_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([CategoriesRetrofitClient])
void main() async {
  await dependenciesSetup();

  group("Categories Remote Datasource", () {
    test("Successful response with non-empty categories list.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var categoriesRetrofitClient = getItTest<MockCategoriesRetrofitClient>();
      var remoteDataSource = CategoriesRemoteDatasourceImpl(
        categoriesRetrofitClient,
        datasourceExecution,
      );

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
      expect((actualResult as Success<List<Category>?>).data, isNotEmpty);
    });

    test("Successful response with an empty categories list.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var categoriesRetrofitClient = getItTest<MockCategoriesRetrofitClient>();
      var remoteDataSource = CategoriesRemoteDatasourceImpl(
        categoriesRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Category>?>([]);
      provideDummy<Results<List<Category>?>>(result);

      when(datasourceExecution.execute<List<Category>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getCategoriesList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Category>?>).data, isEmpty);
    });

    test("Successful response with null categories field.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var categoriesRetrofitClient = getItTest<MockCategoriesRetrofitClient>();
      var remoteDataSource = CategoriesRemoteDatasourceImpl(
        categoriesRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Category>?>(null);
      provideDummy<Results<List<Category>?>>(result);

      when(datasourceExecution.execute<List<Category>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getCategoriesList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Category>?>).data, isNull);
    });

    test("Failure during the API call.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var categoriesRetrofitClient = getItTest<MockCategoriesRetrofitClient>();
      var remoteDataSource = CategoriesRemoteDatasourceImpl(
        categoriesRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Category>?>(Exception());
      provideDummy<Results<List<Category>?>>(result);

      when(datasourceExecution.execute<List<Category>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getCategoriesList();

      expect(actualResult, result);
    });

    test("Network error while fetching data.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var categoriesRetrofitClient = getItTest<MockCategoriesRetrofitClient>();
      var remoteDataSource = CategoriesRemoteDatasourceImpl(
        categoriesRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Category>?>(
        ServerError("There Are Network Error", 500),
      );
      provideDummy<Results<List<Category>?>>(result);

      when(datasourceExecution.execute<List<Category>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getCategoriesList();

      expect(actualResult, result);
      expect((actualResult as Failure<List<Category>?>).exception, isException);
      expect((actualResult).exception, isA<ServerError>());
    });

    test("API call takes an extended time.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var categoriesRetrofitClient = getItTest<MockCategoriesRetrofitClient>();
      var remoteDataSource = CategoriesRemoteDatasourceImpl(
        categoriesRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Category>?>(
        DioException(
            type: DioExceptionType.connectionTimeout,
            requestOptions: RequestOptions()),
      );
      provideDummy<Results<List<Category>?>>(result);

      when(datasourceExecution.execute<List<Category>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getCategoriesList();

      expect(actualResult, result);
      expect(((actualResult as Failure<List<Category>?>).exception as DioException).type,
        equals(DioExceptionType.connectionTimeout),);
    });
  });
}
