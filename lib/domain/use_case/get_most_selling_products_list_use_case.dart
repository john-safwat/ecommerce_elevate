// 📦 Package imports:

// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/domain/repository/products_repository.dart';

@injectable
class GetMostSellingProductsListUseCase {
  ProductsRepository repository;

  GetMostSellingProductsListUseCase(this.repository);

  Future<Results<List<Product>?>> call() async =>
      repository.getBestSellerList();
}
