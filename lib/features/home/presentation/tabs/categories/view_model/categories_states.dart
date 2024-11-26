import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';

sealed class CategoriesStates {}

class CategoriesInitialsState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  List<Category> categories;

  CategoriesSuccessState(this.categories);
}

class ProductsLoadingState extends CategoriesStates {}

class CategoriesTabsSuccessState extends CategoriesStates {
  final List<Product>? products;
  CategoriesTabsSuccessState(this.products);
}

class CategoriesProductsSuccessState extends CategoriesStates {
  List<Product>? products;
  CategoriesProductsSuccessState(this.products);
}

class CatregoriesFailureState extends CategoriesStates {
  String errorMessage;
  Exception exception;

  CatregoriesFailureState(this.errorMessage, this.exception);
}

class ProductsFailureState extends CategoriesStates {
  String errorMessage;
  Exception exception;

  ProductsFailureState(this.errorMessage, this.exception);
}

class ProductsSuccessState extends CategoriesStates {
  List<Product>? products;
  ProductsSuccessState(this.products);
}
