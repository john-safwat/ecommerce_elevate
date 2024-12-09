import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/api/addresses/addresses_retrofit_client.dart';
import 'package:ecommerce_elevate/data/datasource/impl/addresses_remote_datasource_impl.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../core/datasource_execution/mock_datasource_execution.dart';
import '../../../core/di/di_test.dart';
import 'addresses_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([AddressesRetrofitClient])
void main() {
  late AddressesRemoteDatasourceImpl addressesRemoteDatasourceImpl;
  getItTest
      .registerSingleton<MockDataSourceExecution>(MockDataSourceExecution());
  getItTest.registerSingleton<MockAddressesRetrofitClient>(
      MockAddressesRetrofitClient());

  setUp(() {
    addressesRemoteDatasourceImpl = AddressesRemoteDatasourceImpl(
      getItTest<MockAddressesRetrofitClient>(),
      getItTest<MockDataSourceExecution>(),
    );
  });

  group("Add Addresses Function in Addresses Remote Datasource", () {
    test("Add Address Call With Failure Results", () async {
      // Arrange
      MockDataSourceExecution dataSourceExecution = getItTest<MockDataSourceExecution>();
      var result =  Failure<List<Address>?>(Exception());
      provideDummy<Results<List<Address>?>>(result);
      // Act
      when(dataSourceExecution.execute<List<Address>?>(any)).thenAnswer((_) async => result);
      var actualResult = await addressesRemoteDatasourceImpl
          .addNewAddress(AddAddressRequest(), "");
      // Assert
      expect(actualResult, result);
      expect(actualResult, isA<Failure<List<Address>?>>());
    });

    test("Add Address Call With Success Results", () async {
      // Arrange
      MockDataSourceExecution dataSourceExecution = getItTest<MockDataSourceExecution>();
      var result =  Success<List<Address>?>([Address() , Address() , Address()]);
      provideDummy<Results<List<Address>?>>(result);
      // Act
      when(dataSourceExecution.execute<List<Address>?>(any)).thenAnswer((_) async => result);
      var actualResult = await addressesRemoteDatasourceImpl
          .addNewAddress(AddAddressRequest(), "");
      // Assert
      expect(actualResult, result);
      expect(actualResult, isA<Success<List<Address>?>>());
      expect((actualResult as Success<List<Address>?>).data, isA<List<Address>>());
      expect((actualResult).data, hasLength(3));
      
    });
  });
}
