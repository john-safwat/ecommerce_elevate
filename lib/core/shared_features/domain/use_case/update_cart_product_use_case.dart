import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartProductUseCase {
  CartRepository repository;

  UpdateCartProductUseCase(this.repository);

  Future<Results<UserCartResponse>> call(
    String token,
    String id,
    int quantity,
  ) async =>
      repository.updateCart(
        token: token,
        id: id,
        quantity: quantity,
      );
}
