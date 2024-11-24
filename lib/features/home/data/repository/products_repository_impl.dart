// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/products_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/products_repository.dart';

@Injectable(as: ProductsRepository)
class BestSellerRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDatasource _datasource;

  BestSellerRepositoryImpl(this._datasource);

  @override
  Future<Results<List<Product>?>> getBestSellerList() async {
    var response = await _datasource.getBestSellerList();
    return response;
  }
}
