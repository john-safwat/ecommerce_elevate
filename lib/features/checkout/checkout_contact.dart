import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';

///--------------------------[Actions]-------------------------------------
sealed class CheckoutAction extends BaseAction {}

class LoadDataAction extends CheckoutAction{}
class ChangeSelectedAddressAction extends CheckoutAction{
  Address address;

  ChangeSelectedAddressAction(this.address);
}
class AddAddressAction extends CheckoutAction{}
class PlaceOrderAction extends CheckoutAction{}

///--------------------------[states]-------------------------------------
sealed class CheckoutState {}

class InitialCheckoutState extends CheckoutState {}

class LoadingState extends CheckoutState {}

class LoadingSuccessState<T> extends CheckoutState {
  T data;

  LoadingSuccessState(this.data);
}

class LoadingFailState extends CheckoutState {
  String message;

  LoadingFailState(this.message);
}

class NavigateToAddAddress extends CheckoutState{}
class ShowLoadingState extends CheckoutState{}
class ShowSuccessState extends CheckoutState{
  String message;
  ShowSuccessState(this.message);
}

class CheckoutStates {
  late CheckoutState dataLoading;
  late CheckoutState navigationState;

  CheckoutStates() {
    dataLoading = InitialCheckoutState();
    navigationState = InitialCheckoutState();
  }

  CheckoutStates copyWith({
    CheckoutState? newDataLoading,
    CheckoutState? newNavigationState,
  }) {
    return CheckoutStates()
      ..dataLoading = newDataLoading ?? dataLoading
      ..navigationState = newNavigationState ?? navigationState;
  }
}
