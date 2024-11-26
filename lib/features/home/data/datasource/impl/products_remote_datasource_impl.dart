// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/api/products/products_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/products_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import '../../../../../core/datasource_execution/datasource_execution.dart';

@Injectable(as: ProductsRemoteDatasource)
class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  final ProductsRetrofitClient _bestSellerRetrofitClient;
  final DataSourceExecution _apiExecution;

  ProductsRemoteDatasourceImpl(
      this._bestSellerRetrofitClient, this._apiExecution);

  @override
  Future<Results<List<Product>?>> getBestSellerList() async {
    var response = await _apiExecution.execute<List<Product>?>(() async {
      var result = await _bestSellerRetrofitClient.getBestSellerList();
      return result.bestSeller?.map((e) => e.toDomain()).toList();
    });
    return response;
  }
}
