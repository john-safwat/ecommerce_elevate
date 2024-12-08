import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';

sealed class CategoriesStates {}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  List<Category> categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesFaliuerState extends CategoriesStates {
  final String message;

  CategoriesFaliuerState(this.message);
}

class GetAllProductsLoadingState extends CategoriesStates {}

class GetAllProductsEmptyListState extends CategoriesStates {}

class GetAllProductsFaliuerState extends CategoriesStates {
  final String message;

  GetAllProductsFaliuerState(this.message);
}

class GetAllProductsSuccessState extends CategoriesStates {
  List<Product> products;

  GetAllProductsSuccessState(this.products);
}

class NavigatorToProductDetailsState extends CategoriesStates {
  final Product product;

  NavigatorToProductDetailsState(this.product);
}

class AddItemToCartState extends CategoriesStates {}

class AddItemToCartDoneState extends CategoriesStates {}
