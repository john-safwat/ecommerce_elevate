import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/products_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/impl/products_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/features/home/data/repository/products_repository_impl.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/di_test.dart';
import 'products_repository_impl_test.mocks.dart';

@GenerateMocks([ProductsRemoteDatasourceImpl])

void main() async {
  await dependenciesSetup();

  group("Occasion Repository Test", () {
    test('should return a non-empty products list on successful datasource call', () async {

    test(
        'should return a non-empty products list on successful datasource call',
        () async {
      var mockDatasource = getItTest<MockProductsRemoteDatasourceImpl>();

      var repository = ProductsRepositoryImpl(mockDatasource);

      final mockProducts = [
        Product(),
        Product(),
      ];

      var result = Success<List<Product>?>(mockProducts);
      provideDummy<Results<List<Product>?>>(result);
      when(mockDatasource.getBestSellerList()).thenAnswer((_) async => result);
      final actualResult = await repository.getBestSellerList();

      expect(actualResult, result);
      expect(result.data, isNotNull);
      expect(result.data!.length, equals(2));
    });

    test('Failure during the API call.', () async {

      var mockDatasource = getItTest<MockProductsRemoteDatasourceImpl>();
      var repository = ProductsRepositoryImpl(mockDatasource);

      var result = Failure<List<Product>?>(Exception());
      provideDummy<Results<List<Product>?>>(result);
      when(mockDatasource.getBestSellerList()).thenAnswer((_) async => result);

      final actualResult = await repository.getBestSellerList();

      expect(actualResult, result);
      expect(result.exception, isException);
    });
  });
}
