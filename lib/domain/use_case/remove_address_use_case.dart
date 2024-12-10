import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/remove_addresses/response/remove_address_response.dart';

import 'package:ecommerce_elevate/domain/repository/addresses_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveAddressUseCase {
  AddressesRepository repository;

  RemoveAddressUseCase(this.repository);

  Future<Results<RemoveAddressResponse?>> call(
      String id, String token) async =>
      await repository.removeAddress(token, id);
}
