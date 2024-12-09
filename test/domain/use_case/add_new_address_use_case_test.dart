import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/data/repository/addresses_repository_impl.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/request/add_address_request.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/domain/use_case/add_new_address_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/di/di_test.dart';
import 'add_new_address_use_case_test.mocks.dart';

@GenerateMocks([AddressesRepositoryImpl])
void main() {
  late AddNewAddressUseCase useCase;

  getItTest.registerSingleton<MockAddressesRepositoryImpl>(
      MockAddressesRepositoryImpl());
  getItTest.registerSingleton<AddNewAddressUseCase>(
    AddNewAddressUseCase(
      getItTest<MockAddressesRepositoryImpl>(),
    ),
  );

  setUp(() {
    useCase = getItTest<AddNewAddressUseCase>();
  });

  group("Test Add New Address Function", () {
    test("Add Address Call With Failure Results", () async {
      // Arrange
      var repository = getItTest<MockAddressesRepositoryImpl>();

      var result = Failure<List<Address>?>(Exception());
      provideDummy<Results<List<Address>?>>(result);

      // act
      when(repository.addNewAddress(any, any)).thenAnswer(
        (_) async => result,
      );
      var actualResult = await useCase(AddAddressRequest(), "");

      // Assert
      expect(actualResult, result);
      expect(actualResult, isA<Failure<List<Address>?>>());
    });
    test("Add Address Call With Success Results", () async {
      // Arrange
      var repository = getItTest<MockAddressesRepositoryImpl>();

      var result = Success<List<Address>?>([Address(), Address(), Address()]);
      provideDummy<Results<List<Address>?>>(result);

      // act
      when(repository.addNewAddress(any, any)).thenAnswer(
        (_) async => result,
      );
      var actualResult = await useCase(AddAddressRequest(), "");

      // Assert
      expect(actualResult, result);
      expect(actualResult, isA<Success<List<Address>?>>());
      expect((actualResult as Success<List<Address>?>).data, isA<List<Address>>());
      expect((actualResult).data, hasLength(3));
    });
  });
}
