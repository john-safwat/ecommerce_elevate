// 🎯 Dart imports:
import 'dart:async';
import 'dart:io';

// 📦 Package imports:

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/cart/add_to_cart/response/add_to_cart_response.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/add_item_to_cart_use_case.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

abstract class BaseViewModel<T, E extends BaseAction> extends Cubit<T> {
  BaseViewModel(super.initialState, {this.location, this.geoCode});

  LanguageProvider? languageProvider;
  AppConfigProvider? appConfigProvider;
  AppLocalizations? locale;
  Size? mediaQuery;

  Location? location;
  GeoCode? geoCode;

  late ValueNotifier<String> locationMessage =
      ValueNotifier(locale!.getLocation);
  late AddItemToCartUseCase _addItemToCartUseCase;

  Future<void> doIntent(E action);

  Future<void> addProductToCart(
      AddToCartRequest addToCartRequest, T loadingState) async {
    _addItemToCartUseCase = getIt<AddItemToCartUseCase>();
    if (appConfigProvider!.token.isEmpty) {
      AppDialogs.showErrorToast(locale!.notLoggedIn);
      return;
    }
    emit(loadingState);
    var response = await _addItemToCartUseCase(
        addToCartRequest, "Bearer ${appConfigProvider!.token}");
    switch (response) {
      case Success<AddToCartResponse>():
        {
          AppDialogs.showSuccessToast(locale!.addedToCartSuccessfully);
        }
      case Failure<AddToCartResponse>():
        {
          AppDialogs.showErrorToast(mapExceptionToMessage(response.exception));
        }
    }
  }

  String mapExceptionToMessage(Exception exception) {
    if (exception is SocketException) {
      return locale!.socketExceptionMessage;
    } else if (exception is TimeoutException) {
      return locale!.timeoutExceptionMessage;
    } else if (exception is HttpException) {
      return locale!.httpExceptionMessage;
    } else if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return locale!.dioConnectionTimeoutMessage;
        case DioExceptionType.sendTimeout:
          return locale!.dioSendTimeoutMessage;
        case DioExceptionType.receiveTimeout:
          return locale!.dioReceiveTimeoutMessage;
        case DioExceptionType.badCertificate:
          return locale!.dioBadCertificateMessage;
        case DioExceptionType.badResponse:
          return exception.response?.data['error'] ??
              locale!.dioBadResponseMessage;
        case DioExceptionType.cancel:
          return locale!.dioCancelMessage;
        case DioExceptionType.connectionError:
          return locale!.dioConnectionErrorMessage;
        case DioExceptionType.unknown:
          return locale!.dioUnknownMessage;
      }
    } else if (exception is FormatException) {
      return locale!.formatExceptionMessage;
    } else if (exception is IOException) {
      return locale!.ioExceptionMessage;
    } else {
      return locale!.dioDefaultMessage;
    }
  }

  /// Main method to retrieve the user's location and display their address.
  Future<void> getLocation() async {
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
    bool serviceEnabled = await location!.serviceEnabled();
    if (!serviceEnabled) {
      // Request the user to enable the location service.
      serviceEnabled = await location!.requestService();
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
    var permissionGranted = await location!.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      // Request location permissions if they are denied.
      permissionGranted = await location!.requestPermission();
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
      locationData = await location!.getLocation();
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
      var location = await geoCode!.reverseGeocoding(
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
}

abstract class BaseAction {}
