import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/datasource_execution/app_exception.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/data/api/products/products_retrofit_client.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/impl/products_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../core/datasource_execution/mock_datasource_execution.dart';
import '../../../../../core/di/di_test.dart';
import 'products_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([ProductsRetrofitClient])
void main() async {
  await dependenciesSetup();

  group("Occasions Remote Datasource", () {
    test("Successful response with non-empty products list.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var productRetrofitClient = getItTest<MockProductsRetrofitClient>();
      var remoteDataSource = ProductsRemoteDatasourceImpl(
        productRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Product>?>([
        Product(),
        Product(),
        Product(),
      ]);
      provideDummy<Results<List<Product>?>>(result);

      when(datasourceExecution.execute<List<Product>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getBestSellerList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Product>?>).data, isNotEmpty);
    });

    test("Successful response with an empty products list.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var productRetrofitClient = getItTest<MockProductsRetrofitClient>();
      var remoteDataSource = ProductsRemoteDatasourceImpl(
        productRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Product>?>([]);
      provideDummy<Results<List<Product>?>>(result);

      when(datasourceExecution.execute<List<Product>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getBestSellerList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Product>?>).data, isEmpty);
    });

    test("Successful response with null Product field.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var productRetrofitClient = getItTest<MockProductsRetrofitClient>();
      var remoteDataSource = ProductsRemoteDatasourceImpl(
        productRetrofitClient,
        datasourceExecution,
      );

      var result = Success<List<Product>?>(null);
      provideDummy<Results<List<Product>?>>(result);

      when(datasourceExecution.execute<List<Product>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getBestSellerList();

      expect(actualResult, result);
      expect((actualResult as Success<List<Product>?>).data, isNull);
    });

    test("Failure during the API call.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var productRetrofitClient = getItTest<MockProductsRetrofitClient>();
      var remoteDataSource = ProductsRemoteDatasourceImpl(
        productRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Product>?>(Exception());
      provideDummy<Results<List<Product>?>>(result);

      when(datasourceExecution.execute<List<Product>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getBestSellerList();

      expect(actualResult, result);
    });

    test("Network error while fetching data.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var productRetrofitClient = getItTest<MockProductsRetrofitClient>();
      var remoteDataSource = ProductsRemoteDatasourceImpl(
        productRetrofitClient,
        datasourceExecution,
      );

      var result = Failure<List<Product>?>(
        ServerError("There Are Network Error", 500),
      );
      provideDummy<Results<List<Product>?>>(result);

      when(datasourceExecution.execute<List<Product>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getBestSellerList();

      expect(actualResult, result);
      expect((actualResult as Failure<List<Product>?>).exception, isException);
      expect((actualResult).exception, isA<ServerError>());
    });

    test("API call takes an extended time.", () async {
      var datasourceExecution = getItTest<MockDataSourceExecution>();
      var productRetrofitClient = getItTest<MockProductsRetrofitClient>();
      var remoteDataSource = ProductsRemoteDatasourceImpl(
        productRetrofitClient,
        datasourceExecution,
      );


      var result = Failure<List<Product>?>(
        DioException(
            type: DioExceptionType.connectionTimeout,
            requestOptions: RequestOptions()),
      );
      provideDummy<Results<List<Product>?>>(result);

      when(datasourceExecution.execute<List<Product>?>(any))
          .thenAnswer((_) async => result);

      var actualResult = await remoteDataSource.getBestSellerList();

      expect(actualResult, result);
      expect(
        ((actualResult as Failure<List<Product>?>).exception as DioException)
            .type,
        equals(DioExceptionType.connectionTimeout),
      );
    });
  });
}