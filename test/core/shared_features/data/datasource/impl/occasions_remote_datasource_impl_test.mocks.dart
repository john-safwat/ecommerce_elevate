// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/core/shared_features/data/datasource/impl/occasions_remote_datasource_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:ecommerce_elevate/core/shared_features/data/api/occasions/occasions_retrofit_client.dart'
    as _i3;
import 'package:ecommerce_elevate/core/shared_features/data/models/occasions/occasions_response_dto.dart'
    as _i2;
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

class _FakeOccasionResponseDto_0 extends _i1.SmartFake
    implements _i2.OccasionResponseDto {
  _FakeOccasionResponseDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [OccasionsRetrofitClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockOccasionsRetrofitClient extends _i1.Mock
    implements _i3.OccasionsRetrofitClient {
  MockOccasionsRetrofitClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.OccasionResponseDto> getOccasionsList() => (super.noSuchMethod(
        Invocation.method(
          #getOccasionsList,
          [],
        ),
        returnValue: _i4.Future<_i2.OccasionResponseDto>.value(
            _FakeOccasionResponseDto_0(
          this,
          Invocation.method(
            #getOccasionsList,
            [],
          ),
        )),
      ) as _i4.Future<_i2.OccasionResponseDto>);
}