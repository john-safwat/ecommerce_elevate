// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/features/auth/domain/use_case/signup_user_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:ecommerce_elevate/core/datasource_execution/results.dart'
    as _i4;
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart'
    as _i9;
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_response.dart'
    as _i8;
import 'package:ecommerce_elevate/features/auth/domain/entities/forgetPassword/forget_password_response.dart'
    as _i10;
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_response.dart'
    as _i5;
import 'package:ecommerce_elevate/features/auth/domain/entities/registration/registration_user.dart'
    as _i6;
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_request.dart'
    as _i13;
import 'package:ecommerce_elevate/features/auth/domain/entities/reset_password/reset_password_response.dart'
    as _i12;
import 'package:ecommerce_elevate/features/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart'
    as _i11;
import 'package:ecommerce_elevate/features/auth/domain/repository/auth_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

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

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i2.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Results<_i5.RegistrationResponse>> signup(
          _i6.RegistrationUser? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [user],
        ),
        returnValue: _i3.Future<_i4.Results<_i5.RegistrationResponse>>.value(
            _i7.dummyValue<_i4.Results<_i5.RegistrationResponse>>(
          this,
          Invocation.method(
            #signup,
            [user],
          ),
        )),
      ) as _i3.Future<_i4.Results<_i5.RegistrationResponse>>);

  @override
  _i3.Future<_i4.Results<_i8.AuthenticationResponse>> signIn(
    _i9.AuthenticationRequest? auth,
    bool? saveUser,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [
            auth,
            saveUser,
          ],
        ),
        returnValue: _i3.Future<_i4.Results<_i8.AuthenticationResponse>>.value(
            _i7.dummyValue<_i4.Results<_i8.AuthenticationResponse>>(
          this,
          Invocation.method(
            #signIn,
            [
              auth,
              saveUser,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Results<_i8.AuthenticationResponse>>);

  @override
  _i3.Future<_i4.Results<_i10.ForgetPasswordResponse>> forgetPassword(
          String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgetPassword,
          [email],
        ),
        returnValue: _i3.Future<_i4.Results<_i10.ForgetPasswordResponse>>.value(
            _i7.dummyValue<_i4.Results<_i10.ForgetPasswordResponse>>(
          this,
          Invocation.method(
            #forgetPassword,
            [email],
          ),
        )),
      ) as _i3.Future<_i4.Results<_i10.ForgetPasswordResponse>>);

  @override
  _i3.Future<_i4.Results<_i11.VerifyResetCodeResponse>> verifyResetCode(
          String? resetCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyResetCode,
          [resetCode],
        ),
        returnValue:
            _i3.Future<_i4.Results<_i11.VerifyResetCodeResponse>>.value(
                _i7.dummyValue<_i4.Results<_i11.VerifyResetCodeResponse>>(
          this,
          Invocation.method(
            #verifyResetCode,
            [resetCode],
          ),
        )),
      ) as _i3.Future<_i4.Results<_i11.VerifyResetCodeResponse>>);

  @override
  _i3.Future<_i4.Results<_i12.ResetPasswordResponse>> resetPassword(
          _i13.ResetPasswordRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [request],
        ),
        returnValue: _i3.Future<_i4.Results<_i12.ResetPasswordResponse>>.value(
            _i7.dummyValue<_i4.Results<_i12.ResetPasswordResponse>>(
          this,
          Invocation.method(
            #resetPassword,
            [request],
          ),
        )),
      ) as _i3.Future<_i4.Results<_i12.ResetPasswordResponse>>);

  @override
  _i3.Future<void> deleteToken() => (super.noSuchMethod(
        Invocation.method(
          #deleteToken,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}