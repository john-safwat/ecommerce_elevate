import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/domain/use_case/get_all_products_list_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/get_categories_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel
    extends BaseViewModel<CategoriesStates, CategoriesActions> {
  final GetCategoriesListUseCase _getCategoriesListUseCase;
  final GetAllProductsListUseCase _getAllProductsListUseCase;
  CategoriesViewModel(
      this._getCategoriesListUseCase, this._getAllProductsListUseCase)
      : super(CategoriesInitialState());

  @override
  Future<void> doIntent(CategoriesActions action) async {
    switch (action) {
      case LoadCategorisDataActions():
        {
          await _getCategories();
        }
    }
  }

  Future<void> _getCategories() async {
    emit(CategoriesLoadingState());
    var response = await _getCategoriesListUseCase.call();

    switch (response) {
      case Success<List<Category>?>():
        {
          emit(CategoriesSuccessState(response.data ?? []));
        }
      case Failure<List<Category>?>():
        {
          emit(CategoriesFaliuerState(
              mapExceptionToMessage(response.exception)));
        }
    }
  }
}
