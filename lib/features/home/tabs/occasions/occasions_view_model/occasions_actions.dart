import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class OccasionsActions extends BaseAction {}

class LoadTabsAction extends OccasionsActions {}

class LoadProductsAction extends OccasionsActions {}
