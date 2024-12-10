// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';

sealed class OtpVerifyViewState {}

class InitialOtpVerifyViewState extends OtpVerifyViewState {}

class OnCompleteCodeVerifyState extends OtpVerifyViewState {}

class OtpVerifyLoadingState extends OtpVerifyViewState {}

class HideLoadingState extends OtpVerifyViewState {}

class NavigateToResetPasswordScreenState extends OtpVerifyViewState {}

class OtpSuccessState extends OtpVerifyViewState {}

class OtpFailState extends OtpVerifyViewState {
  String message;

  OtpFailState(this.message);
}

class OtpResendLoadingState extends OtpVerifyViewState {}

class OtpResendLoadingSuccessState extends OtpVerifyViewState {}

class OtpResendLoadingFailState extends OtpVerifyViewState {
  String message;

  OtpResendLoadingFailState(this.message);
}

class OtpNextFocusState extends OtpVerifyViewState {}

class OtpPreviousFocusState extends OtpVerifyViewState {}

class UpdateValidationState extends OtpVerifyViewState {}

// events

sealed class OtpVerifyViewAction extends BaseAction {}

class OnCompleteCodeVerifyAction extends OtpVerifyViewAction {}

class NavigateToResetPasswordScreenAction extends OtpVerifyViewAction {}

class OtpResendAction extends OtpVerifyViewAction {}

class FormDataChangedAction extends OtpVerifyViewAction {}

class EnterOtpNumberAction extends OtpVerifyViewAction {
  String otpNumber;
  int index;

  EnterOtpNumberAction(this.otpNumber, this.index);
}

class DisableTimerAction extends OtpVerifyViewAction {}
