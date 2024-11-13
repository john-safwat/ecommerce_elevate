import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_user.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/features/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart';

abstract class AuthRepository {
  Future<Results<RegistrationResponse>> signup(RegistrationUser user);

  Future<Results<AuthenticationResponse>> signIn(
      AuthenticationRequest auth, bool saveUser);

  Future<Results<ForgetPasswordResponse>> forgetPassword(String email);

  Future<Results<VerifyResetCodeResponse>> verifyResetCode(String resetCode);

  Future<Results<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request);

  Future<void> deleteToken();
}
