import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/best_seller_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/best_seller/best_seller.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/best_seller_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:BestSellerRepository )
class BestSellerRepositoryImpl extends BestSellerRepository {
  final BestSellerDatasource _datasource;

  BestSellerRepositoryImpl(this._datasource);

  @override
  Future<Results<List<BestSeller>?>> getBestSellerList()async {
    var response = await _datasource.getBestSellerList();
    return response;

  }



}