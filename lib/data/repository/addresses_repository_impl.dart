import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/contract/addresses_remote_datasource.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/repository/addresses_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressesRepository)
class AddressesRepositoryImpl implements AddressesRepository {
  final AddressesRemoteDatasource _remoteDatasource;

  AddressesRepositoryImpl(this._remoteDatasource);

  @override
  Future<Results<List<Address>?>> addNewAddress(
      AddAddressRequest request, String token) async {
    var response = await _remoteDatasource.addNewAddress(request, token);
    return response;
  }

  @override
  Future<Results<List<Address>?>> getAddresses(String token) async {
    var response = await _remoteDatasource.getAddresses(token);
    return response;
  }
}
