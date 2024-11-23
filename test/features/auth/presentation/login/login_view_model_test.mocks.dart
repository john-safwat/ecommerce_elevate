// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/features/auth/presentation/login/login_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes

// 🎯 Dart imports:
import 'dart:async' as _i3;

// 📦 Package imports:
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

import 'package:ecommerce_elevate/core/datasource_execution/results.dart'
    as _i4;
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_request.dart'
    as _i6;
import 'package:ecommerce_elevate/features/auth/domain/entities/authentication/authentication_response.dart'
    as _i5;
import 'package:ecommerce_elevate/features/auth/domain/use_case/login_user_use_case.dart'
    as _i2;

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

/// A class which mocks [LoginUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUserUseCase extends _i1.Mock implements _i2.LoginUserUseCase {
  MockLoginUserUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Results<_i5.AuthenticationResponse>> call(
    _i6.AuthenticationRequest? auth,
    bool? saveUser,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [
            auth,
            saveUser,
          ],
        ),
        returnValue: _i3.Future<_i4.Results<_i5.AuthenticationResponse>>.value(
            _i7.dummyValue<_i4.Results<_i5.AuthenticationResponse>>(
          this,
          Invocation.method(
            #call,
            [
              auth,
              saveUser,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Results<_i5.AuthenticationResponse>>);
}
