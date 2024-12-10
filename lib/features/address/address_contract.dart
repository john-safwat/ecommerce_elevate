import 'package:country_state_city/models/city.dart';
import 'package:ecommerce_elevate/core/base/base_view_model.dart';

// ---------------------------[Actions]-----------------------------------------
sealed class AddressAction extends BaseAction {}

class InitAddressAction extends AddressAction {}

class UpdateFormAction extends AddressAction {}

class ChangeSelectedCity extends AddressAction {
  City city;

  ChangeSelectedCity(this.city);
}

class SaveAddressAction extends AddressAction{}

// ---------------------------[State]-----------------------------------------
sealed class AddressState {}

class InitialAddressState extends AddressState {}

class DataLoadedAddressState extends AddressState {}
class ShowLoadingState extends AddressState {}
class HideLoadingState extends AddressState {}

class AddressesStates {
  late AddressState addressState;
  late AddressState navigationState;

  AddressesStates() {
    addressState = InitialAddressState();
    navigationState = InitialAddressState();
  }

  AddressesStates copyWith({
    AddressState? newAddressState,
    AddressState? newNavigationState,
  }) {
    return AddressesStates()
      ..addressState = newAddressState ?? addressState
      ..navigationState = newNavigationState ?? navigationState;
  }
}