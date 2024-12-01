
import 'package:ecommerce_elevate/core/shared_features/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';

sealed class OccasionsStates {}

class OccasionInitialsState extends OccasionsStates {}

class OccasionLoadingState extends OccasionsStates {}

class ProductsLoadingState extends OccasionsStates {}

class OccasionTabsSuccessState extends OccasionsStates {
  final List<Occasion>? occasions;

  OccasionTabsSuccessState(this.occasions);
}

class OccasionProductsSuccessState extends OccasionsStates {
  OccasionProductsSuccessState();
}

class OccasionFailureState extends OccasionsStates {
  String errorMessage;
  Exception exception;

  OccasionFailureState(this.errorMessage, this.exception);
}

class ProductsFailureState extends OccasionsStates {
  String errorMessage;
  Exception exception;

  ProductsFailureState(this.errorMessage, this.exception);
}

class NavigatorToProductDetailsState extends OccasionsStates {
  final Product product;

  NavigatorToProductDetailsState(this.product);
}

class EmptyProductsState extends OccasionsStates {}