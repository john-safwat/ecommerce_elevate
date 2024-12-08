// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class ProfileTabActions extends BaseAction {}

class LoadLoggedUserInfo extends ProfileTabActions {}

class OnLoginPressAction extends ProfileTabActions {}

class LogoutUser extends ProfileTabActions {}

class LogoutConfirmationAction extends ProfileTabActions {}

class NavigatorToTermsAndConditionsAction extends ProfileTabActions {}
