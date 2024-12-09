
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';

class AddAddressResponse {
  final String? message;
  final String? error;
  final List<Address>? address;

  AddAddressResponse({
    this.message,
    this.error,
    this.address,
  });

}
