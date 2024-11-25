import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';

abstract interface class ProductsRepository {
  Future<Results<List<Product>?>> getBestSellerList();

  Future<Results<List<Product>?>> getAllProductsList({
    String? occasionId,
    String? categoryId,
  });
}
