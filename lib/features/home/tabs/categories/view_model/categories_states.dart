import 'package:ecommerce_elevate/domain/entities/category/category.dart';

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
