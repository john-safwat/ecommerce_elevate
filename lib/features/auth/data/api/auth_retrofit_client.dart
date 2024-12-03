// 📦 Package imports:
import 'package:dio/dio.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/constants/api_constants.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/edit_profile/request/edit_profile_request_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/edit_profile/response/edit_profile_response_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/forget_password/request/forget_password_request_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/forget_password/response/forget_password_response_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/login/request/authentication_request_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/login/response/authentication_response_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/registration/request/registration_user_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/registration/response/registration_response_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/reset_password/request/reset_password_request_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/reset_password/response/reset_password_response_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/user_info/response/get_user_info_response_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:ecommerce_elevate/features/auth/data/models/authentication/verify_reset_code/response/verify_reset_code_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

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

  @PUT(ApiConstants.editProfileRoute)
  Future<EditProfileResponseDto> editProfile(
    @Header("Authorization") String token,
    @Body() EditProfileRequestDto request,
  );
  @GET(ApiConstants.profileDataRoute)
  Future<GetUserInfoResponseDto> getUserInfo(
    @Header("Authorization") String token,
  );
  @PUT(ApiConstants.uploadProfileRoute)
  @MultiPart()
  Future<String> uploadProfileImage(
    @Header("Authorization") String token,
    @Body() FormData formData,
  );
}
