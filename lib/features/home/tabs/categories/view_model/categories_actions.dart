import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';

sealed class CategoriesActions extends BaseAction {}

class LoadCategorisDataActions extends CategoriesActions {}

class LoadProductsDataActions extends CategoriesActions {
  final String categoryId;

  LoadProductsDataActions(this.categoryId);
}

class NavigatorToProductDetailsActions extends CategoriesActions {
  final Product product;

  NavigatorToProductDetailsActions(this.product);
}

class AddProductToCartActions extends CategoriesActions {
  final Product product;
  AddProductToCartActions(this.product);
}
