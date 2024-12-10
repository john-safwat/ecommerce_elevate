import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/api/addresses/addresses_retrofit_client.dart';
import 'package:ecommerce_elevate/data/datasource/contract/addresses_remote_datasource.dart';
import 'package:ecommerce_elevate/data/models/addresses/request/add_address_request_dto.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/remove_addresses/response/remove_address_response.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:AddressesRemoteDatasource )
class AddressesRemoteDatasourceImpl implements AddressesRemoteDatasource {
  final DataSourceExecution _dataSourceExecution;
  final AddressesRetrofitClient _retrofitClient;

  AddressesRemoteDatasourceImpl(
      this._retrofitClient, this._dataSourceExecution);

  @override
  Future<Results<List<Address>?>> addNewAddress(
      AddAddressRequest request, String token) async {
    var response = await _dataSourceExecution.execute(() async {
      var response = await _retrofitClient.addNewAddress(
          AddAddressRequestDto.fromDomain(request),"Bearer $token");
      return response.address?.map((e) => e.toDomain(),).toList();
    });

    return response;
  }

  @override
  Future<Results<RemoveAddressResponse?>> removeAddress(String token, String id)async {
    var response = await _dataSourceExecution.execute(()async{
      var response = await _retrofitClient.removeAddress("Bearer $token", id);
      return response.toDomain();
    });
    return response;
  }
}
