// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_elevate/test/features/home/data/repository/products_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:ecommerce_elevate/core/datasource_execution/results.dart'
    as _i4;
import 'package:ecommerce_elevate/features/home/data/datasource/contract/products_remote_datasource.dart'
    as _i2;
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart'
    as _i5;
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

/// A class which mocks [ProductsRemoteDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductsRemoteDatasource extends _i1.Mock
    implements _i2.ProductsRemoteDatasource {
  MockProductsRemoteDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Results<List<_i5.Product>?>> getBestSellerList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getBestSellerList,
          [],
        ),
        returnValue: _i3.Future<_i4.Results<List<_i5.Product>?>>.value(
            _i6.dummyValue<_i4.Results<List<_i5.Product>?>>(
          this,
          Invocation.method(
            #getBestSellerList,
            [],
          ),
        )),
      ) as _i3.Future<_i4.Results<List<_i5.Product>?>>);

  @override
  _i3.Future<_i4.Results<List<_i5.Product>?>> getAllProductsList({
    String? occasionId,
    String? categoryId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllProductsList,
          [],
          {
            #occasionId: occasionId,
            #categoryId: categoryId,
          },
        ),
        returnValue: _i3.Future<_i4.Results<List<_i5.Product>?>>.value(
            _i6.dummyValue<_i4.Results<List<_i5.Product>?>>(
          this,
          Invocation.method(
            #getAllProductsList,
            [],
            {
              #occasionId: occasionId,
              #categoryId: categoryId,
            },
          ),
        )),
      ) as _i3.Future<_i4.Results<List<_i5.Product>?>>);
}
