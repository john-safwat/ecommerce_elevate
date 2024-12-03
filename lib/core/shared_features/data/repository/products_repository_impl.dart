// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/products_remote_datasource.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

import '../../domain/repository/products_repository.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDatasource _datasource;

  ProductsRepositoryImpl(this._datasource);

  @override
  Future<Results<List<Product>?>> getBestSellerList() async {
    var response = await _datasource.getBestSellerList();
    return response;
  }

  @override
  Future<Results<List<Product>?>> getAllProductsList(
          {String? occasionId, String? categoryId}) async =>
      await _datasource.getAllProductsList(
        categoryId: categoryId,
        occasionId: occasionId,
      );
}
