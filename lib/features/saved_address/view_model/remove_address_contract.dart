import 'package:ecommerce_elevate/core/base/base_view_model.dart';

// ---------------------------[Actions]-----------------------------------------
sealed class RemoveAddressAction extends BaseAction {}

class SaveRemovedAddressAction extends RemoveAddressAction{
  String id;
  SaveRemovedAddressAction(this.id);
}

// ---------------------------[State]-----------------------------------------
sealed class RemoveAddressState {}

class InitialRemoveAddressState extends RemoveAddressState {}

class SuccessRemoveAddressState extends RemoveAddressState {}
class LoadingRemoveAddressState extends RemoveAddressState {}
class ErrorRemoveAddressState extends RemoveAddressState {}

