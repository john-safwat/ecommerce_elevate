import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/data/api/cart/cart_retrofit_client.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/cart_remote_datasource.dart';
import 'package:ecommerce_elevate/core/shared_features/data/models/cart/add_to_cart/request/add_to_cart_request_dto.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/add_to_cart/response/add_to_cart_response.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDatasource)
class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  final DataSourceExecution _dataSourceExecution;
  final CartRetrofitClient _retrofitClient;

  CartRemoteDatasourceImpl(this._dataSourceExecution, this._retrofitClient);

  @override
  Future<Results<AddToCartResponse>> addItemToCart(
      AddToCartRequest addToCartRequest, String token) async {
    var response = await _dataSourceExecution.execute(() async {
      var response = await _retrofitClient.addItemToCart(
          AddToCartRequestDto.fromDomain(addToCartRequest), token);
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<UserCartResponse>> getUserCart(String token) async {
    var response = await _dataSourceExecution.execute(() async {
      var response = await _retrofitClient.getUserCart(token);
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<UserCartResponse>> updateCart({required String token, required String id, required int quantity})async {
    var response = await _dataSourceExecution.execute(() async {
      var response = await _retrofitClient.updateCart(token, id, {"quantity": quantity});
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<int>> deleteCartProduct({required String token, required String id}) async {
    var response = await _dataSourceExecution.execute(() async {
      var response = await _retrofitClient.deleteCartProduct(token, id);
      return response.cart?.totalPrice??0;
    });
    return response;
  }
}
