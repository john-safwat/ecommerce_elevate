import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/domain/use_case/create_cache_order_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/get_all_address_use_case.dart';
import 'package:ecommerce_elevate/features/checkout/checkout_contact.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutViewModel extends BaseViewModel<CheckoutStates, CheckoutAction> {
  late UserCartResponse userCartResponse;
  Address? address;
  GetAllAddressUseCase getAllAddressUseCase;

  CreateCacheOrderUseCase cacheOrderUseCase;

  CheckoutViewModel(this.getAllAddressUseCase, this.cacheOrderUseCase)
      : super(CheckoutStates());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int paymentMethod = 0;

  bool isGift = false;

  @override
  Future<void> doIntent(CheckoutAction action) async {
    switch (action) {
      case LoadDataAction():
        {
          await _loadData();
        }
      case ChangeSelectedAddressAction():
        {
          _changeSelectedAddress(action.address);
        }
      case AddAddressAction():
        {
          _addAddress();
        }
      case PlaceOrderAction():
        {
          await _placeOrder();
        }
    }
  }

  Future<void> _loadData() async {
    emit(state.copyWith(
        newDataLoading: LoadingState(),
        newNavigationState: InitialCheckoutState()));
    var response = await getAllAddressUseCase(getIt<AppConfigProvider>().token);
    switch (response) {
      case Success<List<Address>?>():
        {
          if (response.data != null) {
            address = response.data!.first;
          }
          emit(
            state.copyWith(
              newDataLoading:
                  LoadingSuccessState<List<Address>?>(response.data),
            ),
          );
        }
      case Failure<List<Address>?>():
        {
          emit(
            state.copyWith(
              newDataLoading: LoadingFailState(
                mapExceptionToMessage(response.exception),
              ),
            ),
          );
        }
    }
  }

  void _changeSelectedAddress(Address address) {
    this.address = address;
    emit(state.copyWith(newDataLoading: state.dataLoading));
  }

  void _addAddress() {
    emit(state.copyWith(newNavigationState: NavigateToAddAddress()));
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

  // mobile validation function to check for the phone number
  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return locale!.enterPhoneNumber;
    } else if (!RegExp(r'^\+20(10|11|12|15)\d{8}$').hasMatch(value)) {
      return locale!.enterValidMobileNumber;
    }
    return null;
  }

  Future<void> _placeOrder() async {
    if (isGift) {
      if (nameValidation(nameController.text) != null ||
          phoneValidation(phoneController.text) != null) {
        AppDialogs.showErrorToast(locale!.nameOrPhoneNumberIsInvalid);
        return;
      }
    }

    emit(state.copyWith(newNavigationState: ShowLoadingState()));
    var response = await cacheOrderUseCase(
      address!,
      appConfigProvider!.token,
    );
    switch (response) {
      case Success<bool>():
        {
          emit(state.copyWith(newNavigationState: ShowSuccessState(locale!.orderPlaceSuccessfully)));
        }
      case Failure<bool>():
        {
          AppDialogs.showErrorToast(mapExceptionToMessage(response.exception));
        }
    }
  }
}
