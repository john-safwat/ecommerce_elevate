import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class HomeTabActions extends BaseAction {}

class LoadLocationAction extends HomeTabActions {}

class LoadDataAction extends HomeTabActions {}
