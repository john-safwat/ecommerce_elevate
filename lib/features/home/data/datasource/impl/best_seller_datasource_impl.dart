import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/data/api/best_seller/products_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/api/occasions/occasions_retrofit_client.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/best_seller_datasource.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/contract/occasions_datasource.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/best_seller/best_seller.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/datasource_execution/datasource_execution.dart';

@Injectable(as: BestSellerDatasource)
class BestSellerDatasourceImpl extends BestSellerDatasource {
  final BestSellerRetrofitClient _bestSellerRetrofitClient;
  final DataSourceExecution _apiExecution;

  BestSellerDatasourceImpl(this._bestSellerRetrofitClient, this._apiExecution);



  @override
  Future<Results<List<BestSeller>?>> getBestSellerList()async {
    var response = await _apiExecution.execute<List<BestSeller>?>(() async {
      var result = await _bestSellerRetrofitClient.getBestSellerList();
      var bestseller = result.bestseller?.map((e) => e.toDomain(),).toList();
      return bestseller;
    });
    return response;
  }


}
