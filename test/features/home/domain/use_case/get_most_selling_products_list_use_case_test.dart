import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/products_repository.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_most_selling_products_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/di_test.dart';
import 'get_most_selling_products_list_use_case_test.mocks.dart';

@GenerateMocks([ProductsRepository])
void main() async {

  await dependenciesSetup();

  group("Occasion Repository Test", () {
    test('should return a non-empty products list on successful datasource call', () async {
      var mockRepository = getItTest<MockProductsRepository>();
      var useCase = GetMostSellingProductsListUseCase(mockRepository);

      final mockProducts = [Product(), Product(),];

      var result = Success<List<Product>?>(mockProducts);
      provideDummy<Results<List<Product>?>>(result);
      when(mockRepository.getBestSellerList()).thenAnswer((_) async => result);
      final actualResult = await useCase();

      expect(actualResult, result);
      expect(result.data, isNotNull);
      expect(result.data!.length, equals(2));
    });

    test('Failure during the API call.', () async {
      var mockRepository = getItTest<MockProductsRepository>();
      var useCase = GetMostSellingProductsListUseCase(mockRepository);

      var result = Failure<List<Product>?>(Exception());
      provideDummy<Results<List<Product>?>>(result);
      when(mockRepository.getBestSellerList()).thenAnswer((_) async => result);

      final actualResult = await useCase();

      expect(actualResult, result);
      expect(result.exception, isException);
    });

  });

}