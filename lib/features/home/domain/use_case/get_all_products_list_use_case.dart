import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsListUseCase {
  ProductsRepository productsRepository;

  @factoryMethod
  GetAllProductsListUseCase(this.productsRepository);

  Future<Results<List<Product>?>> call(
          {String? occasionId, String? categoryId}) async =>
      await productsRepository.getAllProductsList(
        categoryId: categoryId,
        occasionId: occasionId,
      );
}
