import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class CategoriesAction extends BaseAction {}

class LoadCategorisAction extends CategoriesAction {}

class LoadProductsAction extends CategoriesAction {
  final String  categoryId;
  LoadProductsAction({required this.categoryId});
}
