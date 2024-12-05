// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/repository/cart_repository.dart';

@injectable
class DeleteProductFromCartUseCase {
  CartRepository repository;

  DeleteProductFromCartUseCase(this.repository);

  Future<Results<int>> call(
          {required String token, required String id}) async =>
      repository.deleteCartProduct(token: token, id: id);
}
