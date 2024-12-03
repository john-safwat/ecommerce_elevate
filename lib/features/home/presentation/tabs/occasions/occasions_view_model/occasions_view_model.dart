import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_all_products_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionsViewModel
    extends BaseViewModel<OccasionsStates, OccasionsActions> {
  final GetAllProductsListUseCase _allProductsUseCase;

  OccasionsViewModel(this._allProductsUseCase) : super(OccasionInitialsState());

  List<Product> products = [];

  late TabController tabController;
  List<Occasion>? occasions = [];

  @override
  Future<void> doIntent(OccasionsActions action) async {
    switch (action) {
      case LoadProductsAction():
        {
          _getAllProducts(action.occasionId);
        }
      case NavigatorToProductDetails():
        {
          _navigateToProductDetails(action.product);
        }
    }
  }

  Future<void> _getAllProducts(String? occasionId) async {
    this.products = [];
    emit(OccasionLoadingState());

    final Results<List<Product>?> products =
        await _allProductsUseCase(occasionId: occasionId);

    switch (products) {
      case Success<List<Product>?>():
        {
          this.products = products.data ?? [];
          if (this.products.isEmpty) {
            emit(EmptyProductsState());
          } else {
            emit(OccasionProductsSuccessState());
          }
        }

      case Failure<List<Product>?>():
        emit(
          OccasionFailureState(
            mapExceptionToMessage(products.exception),
            products.exception,
          ),
        );
    }
  }

  void _navigateToProductDetails(Product product) async {
    emit(NavigatorToProductDetailsState(product));
  }
}
