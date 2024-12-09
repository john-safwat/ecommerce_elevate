// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/domain/use_case/get_categories_list_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/get_most_selling_products_list_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/get_occasions_list_use_case.dart';
// 📦 Package imports:
import 'package:geocode/geocode.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

import 'home_tab_actions.dart';
import 'home_tab_state.dart';

@injectable
class HomeTabViewModel extends BaseViewModel<HomeTabStates, HomeTabActions> {
  GetOccasionsListUseCase getOccasionsListUseCase;
  GetCategoriesListUseCase getCategoriesListUseCase;
  GetMostSellingProductsListUseCase getMostSellingProductsListUseCase;

  HomeTabViewModel(
      this.getCategoriesListUseCase,
      this.getMostSellingProductsListUseCase,
      this.getOccasionsListUseCase,
      Location location,
      GeoCode geoCode)
      : super(HomeTabStates(), location: location, geoCode: geoCode);

  bool locationLoaded = false;

  @override
  Future<void> doIntent(HomeTabActions action) async {
    switch (action) {
      case LoadLocationAction():
        {
          await getLocation();
        }

      case LoadDataAction():
        {
          await _getData();
        }
    }
  }

  Future<void> _getData() async {
    emit(
      state.copyWith(
        productsState: HomeTabLoadingState(),
        categoriesState: HomeTabLoadingState(),
        occasionsState: HomeTabLoadingState(),
      ),
    );

    var data = await Future.wait(
      [
        getOccasionsListUseCase(),
        getCategoriesListUseCase(),
        getMostSellingProductsListUseCase()
      ],
    );

    var occasionsResponse = data[0] as Results<List<Occasion>?>;
    var categoriesResponse = data[1] as Results<List<Category>?>;
    var productsResponse = data[2] as Results<List<Product>?>;

    HomeTabState occasionsState;
    HomeTabState categoriesState;
    HomeTabState productsState;
    switch (occasionsResponse) {
      case Success<List<Occasion>?>():
        {
          occasionsState = HomeTabLoadingSuccessState<List<Occasion>?>(
            occasionsResponse.data,
          );
        }
      case Failure<List<Occasion>?>():
        {
          occasionsState = HomeTabLoadingFailState(
            mapExceptionToMessage(occasionsResponse.exception),
            occasionsResponse.exception,
          );
        }
    }

    switch (categoriesResponse) {
      case Success<List<Category>?>():
        {
          categoriesState = HomeTabLoadingSuccessState<List<Category>?>(
            categoriesResponse.data,
          );
        }
      case Failure<List<Category>?>():
        {
          categoriesState = HomeTabLoadingFailState(
            mapExceptionToMessage(categoriesResponse.exception),
            categoriesResponse.exception,
          );
        }
    }

    switch (productsResponse) {
      case Success<List<Product>?>():
        {
          productsState = HomeTabLoadingSuccessState<List<Product>?>(
            productsResponse.data,
          );
        }
      case Failure<List<Product>?>():
        {
          productsState = HomeTabLoadingFailState(
            mapExceptionToMessage(productsResponse.exception),
            productsResponse.exception,
          );
        }
    }

    emit(state.copyWith(
      categoriesState: categoriesState,
      productsState: productsState,
      occasionsState: occasionsState,
    ));
  }
}
