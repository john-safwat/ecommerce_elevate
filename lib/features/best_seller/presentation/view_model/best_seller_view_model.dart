// 📦 Package imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/domain/entities/cart/add_to_cart/request/add_to_cart_request.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/view_model/best_seller_action.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/view_model/best_seller_states.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class BestSellerViewModel
    extends BaseViewModel<BestSellerStates, BestSellerAction> {
  BestSellerViewModel() : super(BestSellerInitial());

  @override
  Future<void> doIntent(BestSellerAction action) async {
    switch (action) {
      case NavigatorToProductDetails():
        {
          _navigateToProductDetails(action.product);
        }
      case AddProductToCartAction():
        {
          await _addItemToCart(action.product);
        }
    }
  }

  _navigateToProductDetails(Product product) {
    emit(NavigatorToProductDetailsState(product));
  }

  Future<void> _addItemToCart(Product product) async {
    await addProductToCart(
        AddToCartRequest(
          quantity: 1,
          product: product.id,
        ),
        AddItemToCartState());
    emit(AddItemToCartDoneState());
  }
}
