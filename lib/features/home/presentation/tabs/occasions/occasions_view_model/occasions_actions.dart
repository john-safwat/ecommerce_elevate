import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class OccasionsActions extends BaseAction {}

class LoadProductsAction extends OccasionsActions {
  String? occasionId;
  LoadProductsAction(this.occasionId);
}
