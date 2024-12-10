// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/data/datasource/impl/addresses_remote_datasource_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:ecommerce_elevate/data/api/addresses/addresses_retrofit_client.dart'
    as _i4;
import 'package:ecommerce_elevate/data/models/addresses/remove_addresses/response/remove_address_response_dto.dart'
    as _i3;
import 'package:ecommerce_elevate/data/models/addresses/request/add_address_request_dto.dart'
    as _i6;
import 'package:ecommerce_elevate/data/models/addresses/response/address_response_dto.dart'
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

class _FakeAddressResponseDto_0 extends _i1.SmartFake
    implements _i2.AddressResponseDto {
  _FakeAddressResponseDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveAddressResponseDto_1 extends _i1.SmartFake
    implements _i3.RemoveAddressResponseDto {
  _FakeRemoveAddressResponseDto_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AddressesRetrofitClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddressesRetrofitClient extends _i1.Mock
    implements _i4.AddressesRetrofitClient {
  MockAddressesRetrofitClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.AddressResponseDto> addNewAddress(
    _i6.AddAddressRequestDto? addAddressRequestDto,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addNewAddress,
          [
            addAddressRequestDto,
            token,
          ],
        ),
        returnValue:
            _i5.Future<_i2.AddressResponseDto>.value(_FakeAddressResponseDto_0(
          this,
          Invocation.method(
            #addNewAddress,
            [
              addAddressRequestDto,
              token,
            ],
          ),
        )),
      ) as _i5.Future<_i2.AddressResponseDto>);

  @override
  _i4.Future<_i2.AddressResponseDto> getAddresses(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAddresses,
          [token],
        ),
        returnValue:
            _i4.Future<_i2.AddressResponseDto>.value(_FakeAddressResponseDto_0(
          this,
          Invocation.method(
            #getAddresses,
            [token],
          ),
        )),
      ) as _i4.Future<_i2.AddressResponseDto>);

  @override
  _i5.Future<_i3.RemoveAddressResponseDto> removeAddress(
    String? token,
    String? id,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeAddress,
          [
            token,
            id,
          ],
        ),
        returnValue: _i5.Future<_i3.RemoveAddressResponseDto>.value(
            _FakeRemoveAddressResponseDto_1(
          this,
          Invocation.method(
            #removeAddress,
            [
              token,
              id,
            ],
          ),
        )),
      ) as _i5.Future<_i3.RemoveAddressResponseDto>);
}
