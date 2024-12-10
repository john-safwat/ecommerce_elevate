import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/remove_addresses/response/remove_address_response.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/use_case/get_all_address_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/remove_address_use_case.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveAddressViewModel
    extends BaseViewModel<RemoveAddressState, RemoveAddressAction> {
  RemoveAddressUseCase removeAddressUseCase;

  GetAllAddressUseCase getAllAddressUseCase;

  RemoveAddressViewModel(this.removeAddressUseCase, this.getAllAddressUseCase)
      : super(InitialRemoveAddressState());

  List<Address> address = [];

  @override
  Future<void> doIntent(RemoveAddressAction action) async {
    switch (action) {
      case SaveRemovedAddressAction():
        {
          _removeAddress(action.id);
        }
      case InitViewModel():
        {
          _initAddress();
        }
      case AddAddressAction():{
        _navigateToAddAddressScreen();
      }
    }
  }

  void _removeAddress(String id) async {
    emit(LoadingRemoveAddressState());

    var response =
        await removeAddressUseCase(id, appConfigProvider!.token);

    switch (response) {
      case Success<RemoveAddressResponse?>():
        {
          AppDialogs.showSuccessToast(locale!.addressSavedSuccessfully);
          _initAddress();
          emit(SuccessAddressState());
        }
      case Failure<RemoveAddressResponse?>():
        {
          AppDialogs.showErrorToast(mapExceptionToMessage(response.exception));
        }
      //
    }
  }

  Future<void> _initAddress() async {
    emit(LoadingState());
    var response = await getAllAddressUseCase(getIt<AppConfigProvider>().token);
    switch (response) {
      case Success<List<Address>?>():
        {
          address =response.data!;
          emit(LoadingRemoveAddressState());
        }
      case Failure<List<Address>?>():
        {
          emit(ErrorAddressState());
        }
    }
  }

  void _navigateToAddAddressScreen() {
    emit(NavigateToAddAddressScreen());
  }
}
