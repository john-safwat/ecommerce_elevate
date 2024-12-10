// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';

sealed class CartTabAction extends BaseAction {}

class OnLoginPressAction extends CartTabAction {}

class LoadData extends CartTabAction {}

class GetLocation extends CartTabAction {}

class UpdateProductQuantity extends CartTabAction {
  int quantity;
  String productId;

  UpdateProductQuantity(this.quantity, this.productId);
}

class DeleteProductAction extends CartTabAction {
  String productId;
  int index;

  DeleteProductAction(this.productId, this.index);
}

class NavigateToCheckoutAction extends CartTabAction {
  UserCartResponse userCartResponse;
  NavigateToCheckoutAction(this.userCartResponse);
}