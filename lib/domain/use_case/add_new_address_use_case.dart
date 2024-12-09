import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/repository/addresses_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddNewAddressUseCase {
  AddressesRepository repository;

  AddNewAddressUseCase(this.repository);

  Future<Results<List<Address>?>> call(
          AddAddressRequest request, String token) async =>
      await repository.addNewAddress(request, token);
}
