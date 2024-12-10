import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';

abstract interface class OrdersRepository {
  Future<Results<bool>> createCacheOrder(Address address, String token);
}
