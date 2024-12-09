import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/domain/use_case/get_all_products_list_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/get_categories_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel
    extends BaseViewModel<CategoriesStates, CategoriesActions> {
  final GetCategoriesListUseCase _getCategoriesListUseCase;
  final GetAllProductsListUseCase _getAllProductsListUseCase;
  CategoriesViewModel(
      this._getCategoriesListUseCase, this._getAllProductsListUseCase)
      : super(CategoriesInitialState());

  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  bool isScroll = false;

  @override
  Future<void> doIntent(CategoriesActions action) async {
    switch (action) {
      case LoadCategorisDataActions():
        {
          await _getCategories();
        }
      case LoadProductsDataActions():
        {
          await _getAllProducts(action.categoryId);
        }
      case NavigatorToProductDetailsActions():
        {
          _navigateToProductDetails(action.product);
        }
      case AddProductToCartActions():
        {
          await _addItemToCart(action.product);
        }
      case ScrollFilterAction():
        {
          _listenToShowFilterCard();
        }
    }
  }

  Future<void> _getCategories() async {
    emit(CategoriesLoadingState());
    var response = await _getCategoriesListUseCase.call();

    switch (response) {
      case Success<List<Category>?>():
        {
          emit(CategoriesSuccessState(response.data ?? []));
        }
      case Failure<List<Category>?>():
        {
          emit(CategoriesFaliuerState(
              mapExceptionToMessage(response.exception)));
        }
    }
  }

  Future<void> _getAllProducts(String? categoryId) async {
    emit(GetAllProductsLoadingState());

    final Results<List<Product>?> response =
        await _getAllProductsListUseCase(categoryId: categoryId);

    switch (response) {
      case Success<List<Product>?>():
        {
          if (response.data?.isEmpty ?? true) {
            emit(GetAllProductsEmptyListState());
          } else {
            emit(GetAllProductsSuccessState(response.data ?? []));
          }
        }

      case Failure<List<Product>?>():
        {
          emit(GetAllProductsFaliuerState(
              mapExceptionToMessage(response.exception)));
        }
    }
  }

  Future<void> _addItemToCart(Product product) async {
    await addProductToCart(AddToCartRequest(quantity: 1, product: product.id),
        AddItemToCartState());
    emit(AddItemToCartDoneState());
  }

  void _navigateToProductDetails(Product product) async {
    emit(NavigatorToProductDetailsState(product));
  }

  void _listenToShowFilterCard() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScroll) {
          isScroll = true;
          emit(ScrollDouwnState());
        }
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScroll) {
          isScroll = false;
          emit(ScrollUpState());
        }
      }
    });
  }
}
