// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/domain/repository/cart_repository.dart';

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
