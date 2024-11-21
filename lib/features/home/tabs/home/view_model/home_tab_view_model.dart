import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@injectable
class HomeTabViewModel extends BaseViewModel<HomeTabState, HomeTabActions> {
  Location location;
  GeoCode geoCode;
  HomeTabViewModel(this.location , this.geoCode) : super(InitialHomeTabState());

  late ValueNotifier<String> locationMessage =
      ValueNotifier(locale!.getLocation);
  bool locationLoaded = false;

  @override
  Future<void> doIntent(HomeTabActions action) async{
    switch (action) {
      case LoadLocationAction():
        {
          await _getLocation();
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
      locationMessage.value = "${location.streetNumber} - ${location.streetAddress!}";
    } catch (e) {
      // Display an error message if address resolution fails.
      locationMessage.value = locale!.cantFindYourLocation;
    }
  }
}
