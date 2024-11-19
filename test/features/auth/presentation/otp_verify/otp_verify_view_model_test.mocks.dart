// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/features/auth/presentation/otp_verify/otp_verify_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:ecommerce_elevate/core/datasource_execution/results.dart'
    as _i4;
import 'package:ecommerce_elevate/features/auth/domain/entities/forgetPassword/forget_password_response.dart'
    as _i8;
import 'package:ecommerce_elevate/features/auth/domain/entities/verify_reset_code/verify_reset_code_response.dart'
    as _i5;
import 'package:ecommerce_elevate/features/auth/domain/use_case/forget_password_use_case.dart'
    as _i7;
import 'package:ecommerce_elevate/features/auth/domain/use_case/verify_reset_code_use_case.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

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

/// A class which mocks [VerifyResetPasswordUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockVerifyResetPasswordUseCase extends _i1.Mock
    implements _i2.VerifyResetPasswordUseCase {
  MockVerifyResetPasswordUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Results<_i5.VerifyResetCodeResponse>> call(
          {required String? resetCode}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#resetCode: resetCode},
        ),
        returnValue: _i3.Future<_i4.Results<_i5.VerifyResetCodeResponse>>.value(
            _i6.dummyValue<_i4.Results<_i5.VerifyResetCodeResponse>>(
          this,
          Invocation.method(
            #call,
            [],
            {#resetCode: resetCode},
          ),
        )),
      ) as _i3.Future<_i4.Results<_i5.VerifyResetCodeResponse>>);
}

/// A class which mocks [ForgetPasswordUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockForgetPasswordUseCase extends _i1.Mock
    implements _i7.ForgetPasswordUseCase {
  MockForgetPasswordUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Results<_i8.ForgetPasswordResponse>> call(
          {required String? email}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#email: email},
        ),
        returnValue: _i3.Future<_i4.Results<_i8.ForgetPasswordResponse>>.value(
            _i6.dummyValue<_i4.Results<_i8.ForgetPasswordResponse>>(
          this,
          Invocation.method(
            #call,
            [],
            {#email: email},
          ),
        )),
      ) as _i3.Future<_i4.Results<_i8.ForgetPasswordResponse>>);
}
