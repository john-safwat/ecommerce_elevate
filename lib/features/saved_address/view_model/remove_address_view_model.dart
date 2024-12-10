
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/remove_addresses/response/remove_address_response.dart';
import 'package:ecommerce_elevate/domain/use_case/remove_address_use_case.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_contract.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveAddressViewModel extends BaseViewModel<RemoveAddressState, RemoveAddressAction> {
  RemoveAddressUseCase removeAddressUseCase;

  RemoveAddressViewModel(
      this.removeAddressUseCase, )
      : super(InitialRemoveAddressState());



  ValueNotifier<bool> valid = ValueNotifier(false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Future<void> doIntent(RemoveAddressAction action) async {
    switch (action) {

      case SaveRemovedAddressAction():{
        _removeAddress(action.id);
    }
  }}

 /* Future<void> _initAddress() async {
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
  }*/

  void _removeAddress(String id) async {

      emit(LoadingRemoveAddressState());

      var response = await removeAddressUseCase(id,getIt<AppConfigProvider>().token);
      print(id);
      print("----------------------");
      switch (response) {
        case Success<RemoveAddressResponse?>():
          {
            AppDialogs.showSuccessToast(locale!.addressSavedSuccessfully);
            emit(SuccessRemoveAddressState());
          }        case Failure<RemoveAddressResponse?>():
        {
          emit(ErrorRemoveAddressState());
          AppDialogs.showErrorToast(
              mapExceptionToMessage(response.exception));
        }
          //
      }
    }
  }

