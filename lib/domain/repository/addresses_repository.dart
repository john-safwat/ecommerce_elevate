import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';

abstract interface class AddressesRepository {
  Future<Results<List<Address>?>> addNewAddress(AddAddressRequest request , String token);
}