import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/view_model/best_seller_action.dart';
import 'package:ecommerce_elevate/features/best_seller/presentation/view_model/best_seller_states.dart';
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
    }
  }

  _navigateToProductDetails(Product product) {
    emit(NavigatorToProductDetailsState(product));
  }
}
