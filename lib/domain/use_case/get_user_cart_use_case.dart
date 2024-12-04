// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/domain/repository/cart_repository.dart';

@injectable
class GetUserCartUseCase {
  CartRepository repository;

  GetUserCartUseCase(this.repository);

  Future<Results<UserCartResponse>> call(String token) async =>
      repository.getUserCart(token);
}
