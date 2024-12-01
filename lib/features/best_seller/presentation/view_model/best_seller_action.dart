import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';

sealed class BestSellerAction extends BaseAction {}

class NavigatorToProductDetails extends BestSellerAction {
  final Product product;

  NavigatorToProductDetails({required this.product});
}
