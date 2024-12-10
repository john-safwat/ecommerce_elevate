
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/repository/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCacheOrderUseCase {

  OrdersRepository repository;

  CreateCacheOrderUseCase(this.repository);

  Future<Results<bool>> call(Address address, String token) async => repository.createCacheOrder(address, token);
}

