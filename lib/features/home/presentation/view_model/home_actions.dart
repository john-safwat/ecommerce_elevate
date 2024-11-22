import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class HomeActions extends BaseAction {}
class ChangeSelectedIndex extends HomeActions {
  final int selectedIndex ;
  ChangeSelectedIndex(this.selectedIndex);
}
