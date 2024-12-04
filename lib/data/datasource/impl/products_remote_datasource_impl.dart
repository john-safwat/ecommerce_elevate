// 📦 Package imports:

// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/api/products/products_retrofit_client.dart';
import 'package:ecommerce_elevate/data/datasource/contract/products_remote_datasource.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import '../../../../../core/datasource_execution/datasource_execution.dart';

@Injectable(as: ProductsDatasource)
class ProductsRemoteDatasourceImpl implements ProductsDatasource {
  final ProductsRetrofitClient _productsRetrofitClient;
  final DataSourceExecution _apiExecution;

  ProductsRemoteDatasourceImpl(
      this._productsRetrofitClient, this._apiExecution);

  @override
  Future<Results<List<Product>?>> getBestSellerList() async {
    var response = await _apiExecution.execute<List<Product>?>(() async {
      var result = await _productsRetrofitClient.getBestSellerList();
      return result.bestSeller?.map((e) => e.toDomain()).toList();
    });
    return response;
  }

  @override
  Future<Results<List<Product>?>> getAllProductsList(
      {String? occasionId, String? categoryId}) async {
    var response = await _apiExecution.execute<List<Product>?>(() async {
      var result = await _productsRetrofitClient.getAllProducts(
        occasionId: occasionId,
        categoryId: categoryId,
      );
      return result.products?.map((product) => product.toDomain()).toList();
    });
    return response;
  }
}
