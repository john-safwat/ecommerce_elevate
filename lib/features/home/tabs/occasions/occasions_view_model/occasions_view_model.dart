import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_all_products_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_occasions_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionsViewModel
    extends BaseViewModel<OccasionsStates, OccasionsActions> {
  final GetOccasionsListUseCase _occasionsUseCase;
  final GetAllProductsListUseCase _allProductsUseCase;

  int _occasionsLength = 0;
  int get occasionsLength => _occasionsLength;

  ValueNotifier<String?> selectedOccasionId = ValueNotifier<String?>(null);

  @factoryMethod
  OccasionsViewModel(this._occasionsUseCase, this._allProductsUseCase)
      : super(OccasionInitialsState()) {
    selectedOccasionId.addListener(() {
      if (selectedOccasionId.value != null) {
        _getAllProducts();
      }
    });
  }

  @override
  Future<void> doIntent(OccasionsActions action) async {
    switch (action) {
      case LoadTabsAction():
        return _getOccasionTabs();

      case LoadProductsAction():
        return _getAllProducts();
    }
  }

  Future<void> _getOccasionTabs() async {
    emit(OccasionLoadingState());

    final Results<List<Occasion>?> occasions = await _occasionsUseCase();

    switch (occasions) {
      case Success<List<Occasion>?>():
        _occasionsLength = occasions.data?.length ?? 0;
        emit(OccasionTabsSuccessState(occasions.data));

      case Failure<List<Occasion>?>():
        emit(
          OccasionFailureState(
            mapExceptionToMessage(occasions.exception),
            occasions.exception,
          ),
        );
    }
  }

  Future<void> _getAllProducts() async {
    emit(OccasionLoadingState());

    if (selectedOccasionId.value != null) {
      final Results<List<Product>?> products =
          await _allProductsUseCase(occasionId: selectedOccasionId.value);

      switch (products) {
        case Success<List<Product>?>():
          emit(OccasionProductsSuccessState(products.data));

        case Failure<List<Product>?>():
          emit(
            OccasionFailureState(
              mapExceptionToMessage(products.exception),
              products.exception,
            ),
          );
      }
    }
  }
}
