import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/repository/addresses_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllAddressUseCase {
  AddressesRepository repository;

  GetAllAddressUseCase(this.repository);

  Future<Results<List<Address>?>> call(String token) async => await repository.getAddresses(token);
}
