// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/response/add_to_cart_response.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';

abstract interface class CartRemoteDatasource {
  Future<Results<AddToCartResponse>> addItemToCart(
      AddToCartRequest addToCartRequest, String token);

  Future<Results<UserCartResponse>> getUserCart(String token);

  Future<Results<UserCartResponse>> updateCart(
      {required String token, required String id, required int quantity});

  Future<Results<int>> deleteCartProduct(
      {required String token, required String id});
}
