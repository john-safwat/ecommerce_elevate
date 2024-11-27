import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';

sealed class OccasionsActions extends BaseAction {}

class LoadProductsAction extends OccasionsActions {
  String? occasionId;
  LoadProductsAction(this.occasionId);
}

class NavigatorToProductDetails extends OccasionsActions {
  final Product product;

  NavigatorToProductDetails({required this.product});
}
