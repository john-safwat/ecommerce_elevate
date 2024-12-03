// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';

abstract interface class ProductsDatasource {
  Future<Results<List<Product>?>> getBestSellerList();

  Future<Results<List<Product>?>> getAllProductsList({
    String? occasionId,
    String? categoryId,
  });
}
