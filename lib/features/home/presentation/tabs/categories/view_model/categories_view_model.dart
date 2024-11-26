import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_all_products_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_categories_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/view_model/categories_action.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/view_model/categories_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel
    extends BaseViewModel<CategoriesStates, CategoriesAction> {
  GetCategoriesListUseCase getCategoriesListUseCase;
  final GetAllProductsListUseCase _allProductsUseCase;

  @factoryMethod
  CategoriesViewModel(this.getCategoriesListUseCase, this._allProductsUseCase)
      : super(CategoriesInitialsState());

  @override
  Future<void> doIntent(CategoriesAction action) async {
    switch (action) {
      case LoadCategorisAction():
        {
          await _getAllCategory();
        }
      case LoadProductsAction():
        {
          await _getAllProducts(action.categoryId);
        }
    }
  }

  Future<void> _getAllCategory() async {
    emit(CategoriesLoadingState());

    Results<List<Category>?> categories = await getCategoriesListUseCase.call();

    switch (categories) {
      case Success<List<Category>?>():
        {
          emit(CategoriesSuccessState(categories.data ?? []));
        }
      case Failure<List<Category>?>():
        {
          emit(
            CatregoriesFailureState(
              mapExceptionToMessage(categories.exception),
              categories.exception,
            ),
          );
        }
    }
  }

  Future<void> _getAllProducts(String? categoryId) async {
    emit(ProductsLoadingState());

    final Results<List<Product>?> products =
        await _allProductsUseCase(categoryId: categoryId);

    switch (products) {
      case Success<List<Product>?>():
        emit(CategoriesProductsSuccessState(products.data));

      case Failure<List<Product>?>():
        emit(
          ProductsFailureState(
            mapExceptionToMessage(products.exception),
            products.exception,
          ),
        );
    }
  }
}
