import 'dart:async';

import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/verify_reset_code_use_case.dart';
import 'package:ecommerce_elevate/features/auth/presentation/otp_verify/otp_verify_contract.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpVerifyViewModel
    extends BaseViewModel<OtpVerifyViewState, OtpVerifyViewAction> {
  final VerifyResetPasswordUseCase _verifyResetPasswordUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  late Timer timer;
  late Timer resendOtpTimer;
  int time = 600;
  int resendTimer = 60;

  List<String> opts = List.filled(6, "");

  OtpVerifyViewModel(
      this._verifyResetPasswordUseCase, this._forgetPasswordUseCase)
      : super(InitialOtpVerifyViewState()) {
    _initTimer();
  }

  _initTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
    resendOtpTimer = Timer.periodic(const Duration(seconds: 1), _updateOtpTimer);
  }

  ValueNotifier<String> timerMessage = ValueNotifier<String>("10:00");
  ValueNotifier<String> resendMessage = ValueNotifier<String>("01:00");
  ValueNotifier<bool> valid = ValueNotifier<bool>(false);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otpMessage = "";

  @override
  void doIntent(OtpVerifyViewAction action) {
    switch (action) {
      case OnCompleteCodeVerifyAction():
        {
          _otpVerify();
        }
      case NavigateToResetPasswordScreenAction():
        {
          _navigateToResetPasswordScreen();
        }
      case OtpResendAction():
        {
          _resendOtp();
        }
      case FormDataChangedAction():
        {
          _checkInputFormValidation();
        }
      case EnterOtpNumberAction():
        {
          _otpInput(action.index, action.otpNumber);
        }
      case DisableTimerAction():
        {
          _disableTimer();
        }
    }
  }

  String? otpInputValidation(String value) {
    if (value.length == 1) {
      return null;
    }
    return "0/1";
  }

  void _updateTimer(Timer timer) {
    if (time == 0) {
      return;
    }
    time--;
    String minutes = (time ~/ 60).toString();
    String seconds = (time % 60).toString();
    if (minutes.length == 1) {
      minutes = "0$minutes";
    }
    if (seconds.length == 1) {
      seconds = "0$seconds";
    }

    timerMessage.value = "${locale!.validFor} $minutes:$seconds";
    _checkInputFormValidation();
  }
  void _updateOtpTimer(Timer timer) {
    if (resendTimer ==0){
      return;
    }
    resendTimer--;
    String resendMinutes = (resendTimer ~/ 60).toString();
    String resendSeconds = (resendTimer % 60).toString();
    if (resendMinutes.length == 1) {
      resendMinutes = "0$resendMinutes";
    }
    if (resendMinutes.length == 1) {
      resendMinutes = "0$resendMinutes";
    }
    resendMessage.value = " ${locale!.resendOtpTimerMessage} $resendMinutes:$resendSeconds";
  }

  void _navigateToResetPasswordScreen() {
    emit(NavigateToResetPasswordScreenState());
  }

  void _otpVerify() async {
    if (valid.value) {
      emit(OtpVerifyLoadingState());
      otpMessage = opts.join();
      var response = await _verifyResetPasswordUseCase(resetCode: otpMessage);
      emit(HideLoadingState());
      switch (response) {
        case Success<VerifyResetCodeResponse>():
          {
            emit(OtpSuccessState());
          }
        case Failure<VerifyResetCodeResponse>():
          {
            emit(OtpFailState(mapExceptionToMessage(response.exception)));
          }
      }
    } else {
      if (time == 0) {
        emit(OtpFailState(locale!.timeoutExceptionMessage));
      }
    }
  }

  void _resendOtp() async {
    emit(OtpResendLoadingState());
    var response =
        await _forgetPasswordUseCase(email: appConfigProvider!.email);
    emit(HideLoadingState());
    switch (response) {
      case Success<ForgetPasswordResponse>():
        {
          resendTimer = 60;
          time = 600;
          emit(OtpResendLoadingSuccessState());
        }
      case Failure<ForgetPasswordResponse>():
        {
          emit(OtpResendLoadingFailState(
              mapExceptionToMessage(response.exception)));
        }
    }
  }

  void _disableTimer() {
    timer.cancel();
  }

  void _otpInput(int index, String otpNumber) {
    opts[index] = otpNumber;
    if (otpNumber.isEmpty) {
      emit(OtpPreviousFocusState());
    } else {
      emit(OtpNextFocusState());
    }
  }

  void _checkInputFormValidation() {
    if (opts[0].isEmpty ||
        opts[1].isEmpty ||
        opts[2].isEmpty ||
        opts[3].isEmpty ||
        opts[4].isEmpty ||
        opts[5].isEmpty) {
      valid.value = false;
    } else if (time == 0) {
      valid.value = false;
    } else if (!formKey.currentState!.validate()) {
      valid.value = false;
    } else {
      valid.value = true;
    }
  }
}
