// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/data/models/authentication/change_password/change_password_request/change_password_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/change_password/change_password_response/change_password_response_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/forget_password/request/forget_password_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/forget_password/response/forget_password_response_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/login/request/authentication_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/login/response/authentication_response_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/registration/request/registration_user_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/registration/response/registration_response_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/reset_password/request/reset_password_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/reset_password/response/reset_password_response_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/verify_reset_code/response/verify_reset_code_response_dto.dart';

part 'auth_retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRetrofitClient {
  @factoryMethod
  factory AuthRetrofitClient(Dio dio) = _AuthRetrofitClient;

  @POST(ApiConstants.signupRoute)
  Future<RegistrationResponseDto> signup(@Body() RegistrationUserDto user);

  @POST(ApiConstants.loginRoute)
  Future<AuthenticationResponseDto> signIn(
      @Body() AuthenticationRequestDto authentication);

  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto request);

  @POST(ApiConstants.verifyRestCodeRoute)
  Future<VerifyResetCodeResponseDto> verifyResetCode(
      @Body() VerifyResetCodeRequestDto resetCode);

  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto request);

  @PATCH(ApiConstants.changePasswordRoute)
  Future<ChangePasswordResponseDto> changePassword(
    @Header("Authorization") String token,
    @Body() ChangePasswordRequestDto request,
  );
}
