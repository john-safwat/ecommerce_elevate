import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/cart_remote_datasource.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/add_to_cart/response/add_to_cart_response.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddItemToCartUseCase {
  final CartRemoteDatasource remoteDatasource;

  AddItemToCartUseCase(this.remoteDatasource);

  Future<Results<AddToCartResponse>> call(
      AddToCartRequest request, String token) {
    return remoteDatasource.addItemToCart(request, token);
  }
}
