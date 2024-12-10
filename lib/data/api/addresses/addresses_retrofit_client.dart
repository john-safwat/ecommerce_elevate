import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/addresses/remove_addresses/response/remove_address_response_dto.dart';
import 'package:ecommerce_elevate/data/models/addresses/request/add_address_request_dto.dart';
import 'package:ecommerce_elevate/data/models/addresses/response/add_address_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';


part 'addresses_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AddressesRetrofitClient {
  @factoryMethod
  factory AddressesRetrofitClient(Dio dio) = _AddressesRetrofitClient;


  @PATCH(ApiConstants.addressesRoute)
  Future<AddAddressResponseDto> addNewAddress(
      @Body() AddAddressRequestDto addAddressRequestDto,
      @Header("Authorization") String token);

  @DELETE("${ApiConstants.addressesRoute}/{id}")
  Future<RemoveAddressResponseDto> removeAddress(
      @Header("Authorization") String token,
      @Path("id") String id,
      );

}
