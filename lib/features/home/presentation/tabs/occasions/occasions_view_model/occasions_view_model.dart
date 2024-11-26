import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_all_products_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionsViewModel
    extends BaseViewModel<OccasionsStates, OccasionsActions> {
  final GetAllProductsListUseCase _allProductsUseCase;

  @factoryMethod
  OccasionsViewModel(this._allProductsUseCase) : super(OccasionInitialsState());

  @override
  Future<void> doIntent(OccasionsActions action) async {
    switch (action) {
      case LoadProductsAction():
        return _getAllProducts(action.occasionId);
    }
  }

  Future<void> _getAllProducts(String? occasionId) async {
    emit(OccasionLoadingState());

    final Results<List<Product>?> products =
        await _allProductsUseCase(occasionId: occasionId);

    switch (products) {
      case Success<List<Product>?>():
        emit(OccasionProductsSuccessState(products.data));

      case Failure<List<Product>?>():
        emit(
          OccasionFailureState(
            mapExceptionToMessage(products.exception),
            products.exception,
          ),
        );
    }
  }
}
