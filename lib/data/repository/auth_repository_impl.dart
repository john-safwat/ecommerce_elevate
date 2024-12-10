// 📦 Package imports:

import 'package:dio/src/form_data.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/contract/auth_local_datasource.dart';
import 'package:ecommerce_elevate/data/datasource/contract/auth_remote_datasource.dart';
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
import 'package:ecommerce_elevate/domain/repository/auth_repository.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalDatasource _authLocalDatasource;

  const AuthRepositoryImpl(this._remoteDatasource, this._authLocalDatasource);

  @override
  Future<Results<RegistrationResponse>> signup(RegistrationUser user) async {
    var response = await _remoteDatasource.signup(user);
    return response;
  }

  @override
  Future<Results<AuthenticationResponse>> signIn(
      AuthenticationRequest auth, bool saveUser) async {
    var response = await _remoteDatasource.signIn(auth);
    if (saveUser) {
      if (response is Success<AuthenticationResponse>) {
        await _authLocalDatasource.storeToken(response.data!.token ?? "");
      }
    }
    return response;
  }

  @override
  Future<Results<ForgetPasswordResponse>> forgetPassword(String email) async {
    var response = await _remoteDatasource.forgetPassword(email);
    return response;
  }

  @override
  Future<Results<VerifyResetCodeResponse>> verifyResetCode(
      String resetCode) async {
    var response = await _remoteDatasource.verifyResetCode(resetCode);
    return response;
  }

  @override
  Future<Results<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request) async {
    var response = await _remoteDatasource.resetPassword(request);
    return response;
  }

  @override
  Future<void> deleteToken() async {
    await _authLocalDatasource.deleteToken();
  }

  @override
  Future<Results<ChangePasswordResponse?>> changePassword(
    String token,
    ChangePasswordRequest request,
  ) {
    return _remoteDatasource.changePassword(token, request);
  }

  @override
  Future<Results<EditProfileResponse>> editProfile(
      EditProfileRequest request) async {
    var response = await _remoteDatasource.editProfile(request);
    return response;
  }

  @override
  Future<Results<String>> uploadProfileImage(FormData imageFile) {
    return _remoteDatasource.uploadProfileImage(imageFile);
  }
}
