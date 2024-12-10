import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/addresses/request/add_address_request_dto.dart';
import 'package:ecommerce_elevate/data/models/addresses/response/address_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'addresses_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AddressesRetrofitClient {
  @factoryMethod
  factory AddressesRetrofitClient(Dio dio) = _AddressesRetrofitClient;

  @PATCH(ApiConstants.addressesRoute)
  Future<AddressResponseDto> addNewAddress(
      @Body() AddAddressRequestDto addAddressRequestDto,
      @Header("Authorization") String token);

  @GET(ApiConstants.addressesRoute)
  Future<AddressResponseDto> getAddresses(
      @Header("Authorization") String token);
}
