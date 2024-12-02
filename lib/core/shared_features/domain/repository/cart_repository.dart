import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/response/add_to_cart_response.dart';

abstract interface class CartRepository {
  Future<Results<AddToCartResponse>> addItemToCart(
      AddToCartRequest addToCartRequest , String token);
}
