// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';

sealed class BestSellerAction extends BaseAction {}

class AddProductToCartAction extends BestSellerAction {
  final Product product;

  AddProductToCartAction(this.product);
}

class NavigatorToProductDetails extends BestSellerAction {
  final Product product;

  NavigatorToProductDetails({required this.product});
}
