import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/datasource/impl/addresses_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/data/repository/addresses_repository_impl.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/repository/addresses_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/di/di_test.dart';
import 'addresses_repository_impl_test.mocks.dart';

@GenerateMocks([AddressesRemoteDatasourceImpl])
void main() {
  late AddressesRepository repository;

  getItTest.registerSingleton<MockAddressesRemoteDatasourceImpl>(
      MockAddressesRemoteDatasourceImpl());
  getItTest.registerSingleton<AddressesRepositoryImpl>(
    AddressesRepositoryImpl(
      getItTest<MockAddressesRemoteDatasourceImpl>(),
    ),
  );

  setUp(() {
    repository = getItTest<AddressesRepositoryImpl>();
  });

  group("Test Add New Address Function", () {
    test("Add Address Call With Failure Results", () async {
      // Arrange
      var remoteDatasource = getItTest<MockAddressesRemoteDatasourceImpl>();

      var result = Failure<List<Address>?>(Exception());
      provideDummy<Results<List<Address>?>>(result);

      // act
      when(remoteDatasource.addNewAddress(any , any)).thenAnswer((_)async => result,);
      var actualResult = await repository.addNewAddress(AddAddressRequest(), "");

      // Assert
      expect(actualResult, result);
      expect(actualResult, isA<Failure<List<Address>?>>());

    });
    test("Add Address Call With Success Results", () async {
      // Arrange
      var remoteDatasource = getItTest<MockAddressesRemoteDatasourceImpl>();

      var result = Success<List<Address>?>([Address() , Address() , Address()]);
      provideDummy<Results<List<Address>?>>(result);

      // act
      when(remoteDatasource.addNewAddress(any , any)).thenAnswer((_)async => result,);
      var actualResult = await repository.addNewAddress(AddAddressRequest(), "");

      // Assert
      expect(actualResult, result);
      expect(actualResult, isA<Success<List<Address>?>>());
      expect((actualResult as Success<List<Address>?>).data, isA<List<Address>>());
      expect((actualResult).data, hasLength(3));

    });

  });
}
