import 'package:ecommerce_elevate/core/base/base_view_model.dart';

// ---------------------------[Actions]-----------------------------------------
sealed class RemoveAddressAction extends BaseAction {}

class InitViewModel extends RemoveAddressAction{}
class AddAddressAction extends RemoveAddressAction{}
class SaveRemovedAddressAction extends RemoveAddressAction{
  String id;
  SaveRemovedAddressAction(this.id);
}

// ---------------------------[State]-----------------------------------------
sealed class RemoveAddressState {}

class InitialRemoveAddressState extends RemoveAddressState {}

class NavigateToAddAddressScreen extends RemoveAddressState{}
class LoadingState extends RemoveAddressState {}

class SuccessAddressState extends RemoveAddressState {}
class LoadingRemoveAddressState extends RemoveAddressState {}
class ErrorAddressState extends RemoveAddressState {}

