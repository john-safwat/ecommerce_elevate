// 🎯 Dart imports:
import 'dart:async';

// 🌎 Project imports:
import 'package:dio/dio.dart';
import 'package:ecommerce_elevate/core/datasource_execution/datasource_execution.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/data/api/auth/auth_retrofit_client.dart';
import 'package:ecommerce_elevate/data/datasource/contract/auth_remote_datasource.dart';
import 'package:ecommerce_elevate/data/models/authentication/change_password/change_password_request/change_password_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/forget_password/request/forget_password_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/login/request/authentication_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/registration/request/registration_user_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/reset_password/request/reset_password_request_dto.dart';
import 'package:ecommerce_elevate/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart';
import 'package:ecommerce_elevate/data/models/edit_profile/request/edit_profile_request_dto.dart';
import 'package:ecommerce_elevate/domain/entities/authentication/authentication_request.dart';
import 'package:ecommerce_elevate/domain/entities/authentication/authentication_response.dart';
import 'package:ecommerce_elevate/domain/entities/change_password/change_password_reaponse.dart';
import 'package:ecommerce_elevate/domain/entities/change_password/change_password_request.dart';
import 'package:ecommerce_elevate/domain/entities/edit_profile/edit_profile_request.dart';
import 'package:ecommerce_elevate/domain/entities/edit_profile/edit_profile_response.dart';
import 'package:ecommerce_elevate/domain/entities/forgetPassword/forget_password_response.dart';
import 'package:ecommerce_elevate/domain/entities/registration/registration_response.dart';
import 'package:ecommerce_elevate/domain/entities/registration/registration_user.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_request.dart';
import 'package:ecommerce_elevate/domain/entities/reset_password/reset_password_response.dart';
import 'package:ecommerce_elevate/domain/entities/verify_reset_code/verify_reset_code_response.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 📦 Package imports:

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthRetrofitClient _authRetrofitClient;
  final DataSourceExecution _apiExecution;

  const AuthRemoteDatasourceImpl(this._authRetrofitClient, this._apiExecution);

  @override
  Future<Results<RegistrationResponse>> signup(RegistrationUser user) async {
    var response = await _apiExecution.execute<RegistrationResponse>(() async {
      var response = await _authRetrofitClient
          .signup(RegistrationUserDto.fromDomain(user));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<AuthenticationResponse>> signIn(
      AuthenticationRequest auth) async {
    var response =
        await _apiExecution.execute<AuthenticationResponse>(() async {
      var response = await _authRetrofitClient
          .signIn(AuthenticationRequestDto.fromDomain(auth));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<ForgetPasswordResponse>> forgetPassword(String email) async {
    var response =
        await _apiExecution.execute<ForgetPasswordResponse>(() async {
      var response = await _authRetrofitClient
          .forgetPassword(ForgetPasswordRequestDto(email: email));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<VerifyResetCodeResponse>> verifyResetCode(
      String resetCode) async {
    var response =
        await _apiExecution.execute<VerifyResetCodeResponse>(() async {
      var response = await _authRetrofitClient
          .verifyResetCode(VerifyResetCodeRequestDto(resetCode: resetCode));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) async {
    var response = await _apiExecution.execute<ResetPasswordResponse>(() async {
      var response = await _authRetrofitClient.resetPassword(
          ResetPasswordRequestDto(
              email: request.email, newPassword: request.newPassword));
      return response.toDomain();
    });
    return response;
  }

  @override
  Future<Results<ChangePasswordResponse?>> changePassword(
    String token,
    ChangePasswordRequest request,
  ) async {
    var response = await _apiExecution.execute<ChangePasswordResponse?>(
      () async {
        var response = await _authRetrofitClient.changePassword(
            token,
            ChangePasswordRequestDto(
              password: request.password,
              newPassword: request.newPassword,
            ));
        return response.toDomain();
      },
    );
    return response;
  }

  @override
  Future<Results<EditProfileResponse>> editProfile(EditProfileRequest request) {
    return _apiExecution.execute<EditProfileResponse>(() async {
      var response = await _authRetrofitClient.editProfile(
        "Bearer ${getIt.get<AppConfigProvider>().token}",
        EditProfileRequestDto(
          email: request.email,
          firstName: request.firstName,
          lastName: request.lastName,
          // gender: request.gender,
          phone: request.phone,
          // photo: request.photo,
        ),
      );
      return response.toDomain();
    });
  }

  @override
  Future<Results<String>> uploadProfileImage(FormData imageFile) async {
    // FormData formData = FormData.fromMap({
    //   "photo": await MultipartFile.fromFile(
    //     imageFile.path,
    //     filename: imageFile.path.split('/').last,

    //   ),
    // });
    return await _apiExecution.execute<String>(() async {
      var response = await _authRetrofitClient.uploadProfileImage(
          "Bearer ${getIt.get<AppConfigProvider>().token}", imageFile);
      return response;
    });
  }
}
