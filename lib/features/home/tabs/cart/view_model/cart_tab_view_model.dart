// 📦 Package imports:
import 'package:geocode/geocode.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/domain/use_case/delete_product_from_cart_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/get_user_cart_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/update_cart_product_use_case.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/view_model/cart_tab_events.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/view_model/cart_tab_states.dart';

@injectable
class CartTabViewModel extends BaseViewModel<CartTabStates, CartTabAction> {
  GetUserCartUseCase getUserCartUseCase;
  UpdateCartProductUseCase updateCartProductUseCase;

  DeleteProductFromCartUseCase deleteProductFromCartUseCase;

  CartTabViewModel(this.getUserCartUseCase, this.updateCartProductUseCase,
      this.deleteProductFromCartUseCase, Location location, GeoCode geoCode)
      : super(CartTabStates(), location: location, geoCode: geoCode);

  @override
  Future<void> doIntent(CartTabAction action) async {
    switch (action) {
      case OnLoginPressAction():
        {
          _navigateToLogin();
        }
      case LoadData():
        {
          await _loadData();
        }
      case GetLocation():
        {
          await getLocation();
        }
      case UpdateProductQuantity():
        {
          _updateProductQuantity(action.productId, action.quantity);
        }
      case DeleteProductAction():
        {
          _deleteProductFromCart(action.productId, action.index);
        }
    }
  }

  void _navigateToLogin() {
    emit(state.copyWith(navigationState: NavigateToLoginScreen()));
  }

  Future<void> _loadData() async {
    emit(state.copyWith(userCartState: CartTabLoadingState()));
    var response =
        await getUserCartUseCase("Bearer ${getIt<AppConfigProvider>().token}");
    switch (response) {
      case Success<UserCartResponse>():
        {
          emit(
            state.copyWith(
              userCartState:
                  CartTabLoadingSuccessState<UserCartResponse>(response.data),
            ),
          );
        }
      case Failure<UserCartResponse>():
        {
          emit(
            state.copyWith(
              userCartState: CartTabLoadingFailState(
                mapExceptionToMessage(response.exception),
                response.exception,
              ),
            ),
          );
        }
    }
  }

  void _updateProductQuantity(String productId, int quantity) async {
    AppDialogs.showInfoToast(locale!.updating);
    var response = await updateCartProductUseCase(
        "Bearer ${getIt<AppConfigProvider>().token}", productId, quantity);
    switch (response) {
      case Success<UserCartResponse>():
        {
          emit(
            state.copyWith(
              userCartState:
                  CartTabLoadingSuccessState<UserCartResponse>(response.data),
            ),
          );
        }

      case Failure<UserCartResponse>():
        {
          AppDialogs.showErrorToast(mapExceptionToMessage(response.exception));
        }
    }
  }

  void _deleteProductFromCart(String productId, int index) async {
    AppDialogs.showInfoToast(locale!.deleting);
    var response = await deleteProductFromCartUseCase(
        token: "Bearer ${getIt<AppConfigProvider>().token}", id: productId);
    switch (response) {
      case Success<int>():
        {
          var data = (state.userCartState
                  as CartTabLoadingSuccessState<UserCartResponse>)
              .data;
          data?.cart?.cartItems?.removeAt(index);
          data?.cart?.totalPrice = response.data;
          data?.numOfCartItems = data.cart?.cartItems?.length ?? 0;
          emit(
            state.copyWith(
              userCartState: CartTabLoadingSuccessState<UserCartResponse>(
                state.userCartState.data,
              ),
            ),
          );
        }
      case Failure<int>():
        {
          AppDialogs.showErrorToast(mapExceptionToMessage(response.exception));
        }
    }
  }
}
