import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/data/datasource/contract/cart_remote_datasource.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/response/add_to_cart_response.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource _remoteDatasource;

  CartRepositoryImpl(this._remoteDatasource);

  @override
  Future<Results<AddToCartResponse>> addItemToCart(
      AddToCartRequest addToCartRequest , String token) async {
    var response = await _remoteDatasource.addItemToCart(addToCartRequest , token);
    return response;
  }
}
