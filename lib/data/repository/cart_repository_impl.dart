// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/contract/cart_remote_datasource.dart';
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/response/add_to_cart_response.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/domain/repository/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource _remoteDatasource;

  CartRepositoryImpl(this._remoteDatasource);

  @override
  Future<Results<AddToCartResponse>> addItemToCart(
      AddToCartRequest addToCartRequest, String token) async {
    var response =
        await _remoteDatasource.addItemToCart(addToCartRequest, token);
    return response;
  }

  @override
  Future<Results<UserCartResponse>> getUserCart(String token) async {
    var response = await _remoteDatasource.getUserCart(token);
    return response;
  }

  @override
  Future<Results<UserCartResponse>> updateCart(
      {required String token,
      required String id,
      required int quantity}) async {
    var response = await _remoteDatasource.updateCart(
        token: token, id: id, quantity: quantity);
    return response;
  }

  @override
  Future<Results<int>> deleteCartProduct(
      {required String token, required String id}) async {
    var response =
        await _remoteDatasource.deleteCartProduct(token: token, id: id);
    return response;
  }
}
