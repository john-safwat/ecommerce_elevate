import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteProductFromCartUseCase {
  CartRepository repository;

  DeleteProductFromCartUseCase(this.repository);

  Future<Results<int>> call(
          {required String token, required String id}) async =>
      repository.deleteCartProduct(token: token, id: id);
}
