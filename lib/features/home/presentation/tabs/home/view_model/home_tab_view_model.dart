// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/get_categories_list_use_case.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/get_most_selling_products_list_use_case.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/get_occasions_list_use_case.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
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
  Location location;
  GeoCode geoCode;

  HomeTabViewModel(
      this.getCategoriesListUseCase,
      this.getMostSellingProductsListUseCase,
      this.getOccasionsListUseCase,
      this.location,
      this.geoCode)
      : super(HomeTabStates());

  late ValueNotifier<String> locationMessage =
      ValueNotifier(locale!.getLocation);
  bool locationLoaded = false;

  @override
  Future<void> doIntent(HomeTabActions action) async {
    switch (action) {
      case LoadLocationAction():
        {
          await _getLocation();
        }

      case LoadDataAction():
        {
          await _getData();
        }
    }
  }

  /// Main method to retrieve the user's location and display their address.
  Future<void> _getLocation() async {
    // Check if the location service is enabled.
    var serviceEnabled = await _checkForLocationService();
    if (!serviceEnabled) {
      // Update the UI message if the location service is disabled.
      locationMessage.value = locale!.youMustEnableLocation;
      return;
    }

    // Check if the app has location permissions.
    var permissionGranted = await _checkForLocationPermission();
    if (!permissionGranted) {
      // Update the UI message if permissions are not granted.
      locationMessage.value = locale!.locationPermissionNotGranted;
      return;
    }

    // Attempt to retrieve the user's location data.
    var locationData = await _getLocationData();
    if (locationData == null) {
      // Exit if location data retrieval fails.
      return;
    }

    // Use the location data to fetch and display the user's address.
    await _getUserAddress(locationData);
  }

  /// Checks if the location service is enabled on the device.
  /// If the service is disabled, it prompts the user to enable it.
  ///
  /// Returns:
  /// - `true` if the location service is enabled.
  /// - `false` otherwise.
  Future<bool> _checkForLocationService() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      // Request the user to enable the location service.
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  /// Checks if the app has the necessary location permissions.
  /// If permissions are denied, it requests them from the user.
  ///
  /// Returns:
  /// - `true` if location permissions are granted.
  /// - `false` otherwise.
  Future<bool> _checkForLocationPermission() async {
    var permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      // Request location permissions if they are denied.
      permissionGranted = await location.requestPermission();
    }
    // Ensure permissions are granted before proceeding.
    return permissionGranted == PermissionStatus.granted;
  }

  /// Attempts to retrieve the user's current geographic location.
  /// If the retrieval fails, an error message is displayed in the UI.
  ///
  /// Returns:
  /// - A `LocationData` object if successful.
  /// - `null` if an error occurs during location retrieval.
  Future<LocationData?> _getLocationData() async {
    LocationData locationData;
    try {
      // Retrieve the current location data.
      locationData = await location.getLocation();
    } catch (e) {
      // Display an error message if location data cannot be retrieved.
      locationMessage.value = locale!.cantFindYourLocation;
      return null;
    }
    return locationData;
  }

  /// Uses the provided location data to perform reverse geocoding and
  /// obtain the user's address. Updates the UI with the resolved address.
  ///
  /// Parameters:
  /// - `locationData`: The geographic coordinates of the user's location.
  ///
  /// Returns:
  /// - A `Future` that completes when the address retrieval is finished.
  Future<void> _getUserAddress(LocationData locationData) async {
    try {
      // Perform reverse geocoding to retrieve the address.
      var location = await geoCode.reverseGeocoding(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      );
      // Update the UI with the resolved address or a fallback message.
      locationMessage.value =
          "${location.streetNumber} - ${location.streetAddress!}";
    } catch (e) {
      // Display an error message if address resolution fails.
      locationMessage.value = locale!.cantFindYourLocation;
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
