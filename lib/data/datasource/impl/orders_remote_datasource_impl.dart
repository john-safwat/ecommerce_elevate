import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/api/order/orders_retrofit_client.dart';
import 'package:ecommerce_elevate/data/datasource/contract/orders_remote_datasource.dart';
import 'package:ecommerce_elevate/data/models/orders/create_order/request/create_cache_order_request_dto.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRemoteDatasource)
class OrdersRemoteDatasourceImpl implements OrdersRemoteDatasource {
  final DataSourceExecution _execution;
  final OrdersRetrofitClient _retrofitClient;

  OrdersRemoteDatasourceImpl(this._retrofitClient, this._execution);

  @override
  Future<Results<bool>> createCacheOrder(Address address, String token) async {
    var response = await _execution.execute(() async {
      await _retrofitClient.crateCacheOrder(
          CreateCacheOrderRequestDto(
            shippingAddress: ShippingAddressDto.fromDomain(address),
          ),
          "Bearer $token");
      return true;
    });
    return response;
  }
}
