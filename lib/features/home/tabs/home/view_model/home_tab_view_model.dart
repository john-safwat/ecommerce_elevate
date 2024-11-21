import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/cateogry/Categories.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/occasions_use_case.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import '../../../domain/entities/occasions/occasions.dart';
import 'home_tab_actions.dart';
import 'home_tab_state.dart';

@injectable
class HomeTabViewModel extends BaseViewModel<HomeTabState, HomeTabActions> {
  OccasionsUseCase homeTabUseCase;
  HomeTabViewModel(this.homeTabUseCase) : super(DataLoadingInitialState());

  late ValueNotifier<String> locationMessage =
      ValueNotifier(locale!.getLocation);
  final Location _location = Location();
  bool locationLoaded = false;
  List<Categories> categoriesList = [];
  List<Occasions> occasionsList = [];

  @override
  void doIntent(HomeTabActions action) {
    switch (action) {
      case LoadLocationAction():
        {
          _getLocation();
        }

      case LoadDataAction():{
        _loadData();
      }
    }
  }
  /*_getCategoryInfo()async{
    emit(LoadingHomeTabCategoryState('loading'));
    //final result = await categoryUseCase.callCategories();
    switch (result) {

      case Success<CategoriesResponseEntity>():{
        categories = result.data!.categories??[];
        emit(SuccessHomeTabCategoryState());}
      case Failure<CategoriesResponseEntity>():{
        emit(FailHomeTabCategoryState(mapExceptionToMessage(result.exception)));
      }
    }
  }*/
  void _loadData()async {
    emit(DataLoadingState());
  var response = await Future.wait([homeTabUseCase()]);
  Results<List<Categories>> categoriesResponse = response[1] as Results<List<Categories>>;
  Results<List<Occasions>> occasions = response[0] as Results<List<Occasions>>;
  if (categoriesResponse is Failure<List<Categories>>){
    emit(DataLoadingFailState(mapExceptionToMessage(categoriesResponse.exception)));
  }
  if (occasions is Failure<List<Occasions>>){
    emit(DataLoadingFailState(mapExceptionToMessage(occasions.exception)));
  }
  else {
    occasions as Success<List<Occasions>>;
    categoriesResponse as Success<List<Categories>>;
    occasionsList = occasions.data??[];
    categoriesList = categoriesResponse.data??[];
    emit(DataLoadingSuccessState());
  }
  }


  /// Main method to retrieve the user's location and display their address.
  _getLocation() async {
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
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      // Request the user to enable the location service.
      serviceEnabled = await _location.requestService();
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
    var permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      // Request location permissions if they are denied.
      permissionGranted = await _location.requestPermission();
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
      locationData = await _location.getLocation();
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
      var location = await GeoCode().reverseGeocoding(
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
