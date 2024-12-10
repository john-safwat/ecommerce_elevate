// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/domain/use_case/add_new_address_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:ecommerce_elevate/core/datasource_execution/results.dart'
    as _i4;
import 'package:ecommerce_elevate/data/repository/addresses_repository_impl.dart'
    as _i2;
import 'package:ecommerce_elevate/domain/entities/addresses/remove_addresses/response/remove_address_response.dart'
    as _i8;
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart'
    as _i6;
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart'
    as _i5;
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

/// A class which mocks [AddressesRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddressesRepositoryImpl extends _i1.Mock
    implements _i2.AddressesRepositoryImpl {
  MockAddressesRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Results<List<_i5.Address>?>> addNewAddress(
    _i6.AddAddressRequest? request,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addNewAddress,
          [
            request,
            token,
          ],
        ),
        returnValue: _i3.Future<_i4.Results<List<_i5.Address>?>>.value(
            _i7.dummyValue<_i4.Results<List<_i5.Address>?>>(
          this,
          Invocation.method(
            #addNewAddress,
            [
              request,
              token,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Results<List<_i5.Address>?>>);

  @override
  _i3.Future<_i4.Results<_i8.RemoveAddressResponse?>> removeAddress(
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
        returnValue: _i3.Future<_i4.Results<_i8.RemoveAddressResponse?>>.value(
            _i7.dummyValue<_i4.Results<_i8.RemoveAddressResponse?>>(
          this,
          Invocation.method(
            #removeAddress,
            [
              token,
              id,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Results<_i8.RemoveAddressResponse?>>);
}
