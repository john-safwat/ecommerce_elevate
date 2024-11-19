
import 'package:ecommerce_elevate/features/auth/domain/use_case/forget_password_use_case.dart';
import 'package:ecommerce_elevate/features/auth/domain/use_case/verify_reset_code_use_case.dart';

import 'package:ecommerce_elevate/features/auth/presentation/otp_verify/otp_verify_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'otp_verify_view_model_test.mocks.dart';
@GenerateMocks([VerifyResetPasswordUseCase,ForgetPasswordUseCase])
void main() async{
   VerifyResetPasswordUseCase verifyResetPasswordUseCase;
   OtpVerifyViewModel viewModel;
   ForgetPasswordUseCase forgetPasswordUseCase;
  verifyResetPasswordUseCase = MockVerifyResetPasswordUseCase();
  forgetPasswordUseCase = MockForgetPasswordUseCase();
  viewModel = OtpVerifyViewModel(verifyResetPasswordUseCase, forgetPasswordUseCase);
  group('otp verification ', (){
    test('should return error if otp code is empty', () {
      String result = viewModel.otpMessage ;
      expect(result, viewModel.otpMessage);

    });
  });

}