import 'dart:async';

import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/use_case/add_new_address_use_case.dart';
import 'package:ecommerce_elevate/features/address/address_contract.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart' as geo_code;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@injectable
class AddressViewModel extends BaseViewModel<AddressesStates, AddressAction> {
  AddNewAddressUseCase addNewAddressUseCase;

  AddressViewModel(
      this.addNewAddressUseCase, Location location, geo_code.GeoCode geoCode)
      : super(AddressesStates(), location: location, geoCode: geoCode);

  List<City> cities = [];
  City selectedCity = City(name: "All", countryCode: "EG", stateCode: "123");
  LocationData? locationData;
  late GoogleMapController mapController;
  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  ValueNotifier<bool> valid = ValueNotifier(false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Future<void> doIntent(AddressAction action) async {
    switch (action) {
      case InitAddressAction():
        {
          await _initAddress();
        }
      case UpdateFormAction():
        {
          await _updateValidation();
        }
      case ChangeSelectedCity():
        {
          _changeSelectedCity(action.city);
        }
      case SaveAddressAction():
        {
          await _addNewAddress();
        }
    }
  }

  Future<void> _initAddress() async {
    cities = await getCountryCities("EG");
    selectedCity = cities.first;
    emit(state.copyWith(newAddressState: DataLoadedAddressState()));
    locationData = await getLocation();
    emit(state.copyWith(newAddressState: DataLoadedAddressState()));
    if (locationData != null) {
      cameraPosition = CameraPosition(
        target: LatLng(locationData?.latitude ?? 37.42796133580664,
            locationData?.longitude ?? -122.085749655962),
        zoom: 16.4746,
      );
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  // validation functions
  // validate on the name if it is not empty and doesn't contain ant spacial characters
  String? nameValidation(String name) {
    if (name.isEmpty) {
      return locale!.nameCantBeEmpty;
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return locale!.invalidName;
    } else {
      return null;
    }
  }

  String? addressValidation(String name) {
    if (name.isEmpty) {
      return locale!.addressCantBeEmpty;
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return locale!.invalidAddress;
    } else {
      return null;
    }
  }

  // mobile validation function to check for the phone number
  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return locale!.enterPhoneNumber;
    } else if (!RegExp(r'^\+20(10|11|12|15)\d{8}$').hasMatch(value)) {
      return locale!.enterValidMobileNumber;
    }
    return null;
  }

  Future<void> _updateValidation() async {
    if (cities.isEmpty) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }

  void _changeSelectedCity(City city) {
    selectedCity = city;
    emit(state.copyWith(newAddressState: DataLoadedAddressState()));
  }

  Future<void> _addNewAddress() async {
    if (!valid.value) return;
    if (cities.isEmpty) return;
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(newNavigationState: ShowLoadingState()));

      var response = await addNewAddressUseCase(
        AddAddressRequest(
          city: selectedCity.name,
          phone: phoneController.text,
          street: addressController.text,
        ),
        appConfigProvider!.token,
      );
      emit(state.copyWith(newNavigationState: HideLoadingState()));
      switch (response) {
        case Success<List<Address>?>():
          {
            AppDialogs.showSuccessToast(locale!.addressSavedSuccessfully);
            emit(state.copyWith(newNavigationState: HideLoadingState()));
          }
        case Failure<List<Address>?>():
          {
            AppDialogs.showErrorToast(
                mapExceptionToMessage(response.exception));
          }
      }
    }
  }
}
