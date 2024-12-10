import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/contract/orders_remote_datasource.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/repository/orders_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository{
  final OrdersRemoteDatasource _ordersRemoteDatasource;

  OrdersRepositoryImpl(this._ordersRemoteDatasource);

  @override
  Future<Results<bool>> createCacheOrder(Address address, String token) async {
    var response = await _ordersRemoteDatasource.createCacheOrder(address, token);
    return response;
  }

}