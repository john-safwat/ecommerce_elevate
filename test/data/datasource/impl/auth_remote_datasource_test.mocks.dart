// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/data/datasource/impl/auth_remote_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:ecommerce_elevate/data/api/auth/auth_retrofit_client.dart'
    as _i8;
import 'package:ecommerce_elevate/data/models/authentication/change_password/change_password_request/change_password_request_dto.dart'
    as _i15;
import 'package:ecommerce_elevate/data/models/authentication/change_password/change_password_response/change_password_response_dto.dart'
    as _i7;
import 'package:ecommerce_elevate/data/models/authentication/forget_password/request/forget_password_request_dto.dart'
    as _i12;
import 'package:ecommerce_elevate/data/models/authentication/forget_password/response/forget_password_response_dto.dart'
    as _i4;
import 'package:ecommerce_elevate/data/models/authentication/login/request/authentication_request_dto.dart'
    as _i11;
import 'package:ecommerce_elevate/data/models/authentication/login/response/authentication_response_dto.dart'
    as _i3;
import 'package:ecommerce_elevate/data/models/authentication/registration/request/registration_user_dto.dart'
    as _i10;
import 'package:ecommerce_elevate/data/models/authentication/registration/response/registration_response_dto.dart'
    as _i2;
import 'package:ecommerce_elevate/data/models/authentication/reset_password/request/reset_password_request_dto.dart'
    as _i14;
import 'package:ecommerce_elevate/data/models/authentication/reset_password/response/reset_password_response_dto.dart'
    as _i6;
import 'package:ecommerce_elevate/data/models/authentication/verify_reset_code/request/verify_reset_code_request_dto.dart'
    as _i13;
import 'package:ecommerce_elevate/data/models/authentication/verify_reset_code/response/verify_reset_code_response_dto.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRegistrationResponseDto_0 extends _i1.SmartFake
    implements _i2.RegistrationResponseDto {
  _FakeRegistrationResponseDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthenticationResponseDto_1 extends _i1.SmartFake
    implements _i3.AuthenticationResponseDto {
  _FakeAuthenticationResponseDto_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForgetPasswordResponseDto_2 extends _i1.SmartFake
    implements _i4.ForgetPasswordResponseDto {
  _FakeForgetPasswordResponseDto_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerifyResetCodeResponseDto_3 extends _i1.SmartFake
    implements _i5.VerifyResetCodeResponseDto {
  _FakeVerifyResetCodeResponseDto_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResetPasswordResponseDto_4 extends _i1.SmartFake
    implements _i6.ResetPasswordResponseDto {
  _FakeResetPasswordResponseDto_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeChangePasswordResponseDto_5 extends _i1.SmartFake
    implements _i7.ChangePasswordResponseDto {
  _FakeChangePasswordResponseDto_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRetrofitClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRetrofitClient extends _i1.Mock
    implements _i8.AuthRetrofitClient {
  MockAuthRetrofitClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i2.RegistrationResponseDto> signup(
          _i10.RegistrationUserDto? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [user],
        ),
        returnValue: _i9.Future<_i2.RegistrationResponseDto>.value(
            _FakeRegistrationResponseDto_0(
          this,
          Invocation.method(
            #signup,
            [user],
          ),
        )),
      ) as _i9.Future<_i2.RegistrationResponseDto>);

  @override
  _i9.Future<_i3.AuthenticationResponseDto> signIn(
          _i11.AuthenticationRequestDto? authentication) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [authentication],
        ),
        returnValue: _i9.Future<_i3.AuthenticationResponseDto>.value(
            _FakeAuthenticationResponseDto_1(
          this,
          Invocation.method(
            #signIn,
            [authentication],
          ),
        )),
      ) as _i9.Future<_i3.AuthenticationResponseDto>);

  @override
  _i9.Future<_i4.ForgetPasswordResponseDto> forgetPassword(
          _i12.ForgetPasswordRequestDto? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgetPassword,
          [request],
        ),
        returnValue: _i9.Future<_i4.ForgetPasswordResponseDto>.value(
            _FakeForgetPasswordResponseDto_2(
          this,
          Invocation.method(
            #forgetPassword,
            [request],
          ),
        )),
      ) as _i9.Future<_i4.ForgetPasswordResponseDto>);

  @override
  _i9.Future<_i5.VerifyResetCodeResponseDto> verifyResetCode(
          _i13.VerifyResetCodeRequestDto? resetCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetCode,
          [resetCode],
        ),
        returnValue: _i9.Future<_i5.VerifyResetCodeResponseDto>.value(
            _FakeVerifyResetCodeResponseDto_3(
          this,
          Invocation.method(
            #verifyResetCode,
            [resetCode],
          ),
        )),
      ) as _i9.Future<_i5.VerifyResetCodeResponseDto>);

  @override
  _i9.Future<_i6.ResetPasswordResponseDto> resetPassword(
          _i14.ResetPasswordRequestDto? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [request],
        ),
        returnValue: _i9.Future<_i6.ResetPasswordResponseDto>.value(
            _FakeResetPasswordResponseDto_4(
          this,
          Invocation.method(
            #resetPassword,
            [request],
          ),
        )),
      ) as _i9.Future<_i6.ResetPasswordResponseDto>);

  @override
  _i9.Future<_i7.ChangePasswordResponseDto> changePassword(
    String? token,
    _i15.ChangePasswordRequestDto? request,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #changePassword,
          [
            token,
            request,
          ],
        ),
        returnValue: _i9.Future<_i7.ChangePasswordResponseDto>.value(
            _FakeChangePasswordResponseDto_5(
          this,
          Invocation.method(
            #changePassword,
            [
              token,
              request,
            ],
          ),
        )),
      ) as _i9.Future<_i7.ChangePasswordResponseDto>);
}
