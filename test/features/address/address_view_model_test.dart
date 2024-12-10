import 'package:country_state_city/models/city.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/providers/language_provider.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart'
    as address;
import 'package:ecommerce_elevate/domain/use_case/add_new_address_use_case.dart';
import 'package:ecommerce_elevate/features/address/address_contract.dart';
import 'package:ecommerce_elevate/features/address/address_view.dart';
import 'package:ecommerce_elevate/features/address/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../core/datasource_execution/mock_shared_prefrences.dart';
import '../../core/di/di_test.dart';
import 'address_view_model_test.mocks.dart';

@GenerateMocks([Location, GeoCode, AddNewAddressUseCase])
void main() async {
  late AddressViewModel viewModel;

  getItTest.registerSingletonAsync<AppLocalizations>(
    () async => await AppLocalizations.delegate.load(
      const Locale("en"),
    ),
  );
  getItTest.registerSingleton<Locale>(const Locale("en"));
  await getItTest.isReady<AppLocalizations>();
  getItTest.registerSingleton<MockLocation>(MockLocation());
  getItTest.registerSingleton<MockSharedPreferences>(MockSharedPreferences());
  getItTest.registerSingleton<MockGeoCode>(MockGeoCode());
  getItTest
      .registerSingleton<MockAddNewAddressUseCase>(MockAddNewAddressUseCase());
  getItTest.registerSingleton(
    AddressViewModel(
      getItTest<MockAddNewAddressUseCase>(),
      getItTest<MockLocation>(),
      getItTest<MockGeoCode>(),
    ),
  );

  setUp(() {
    viewModel = getItTest<AddressViewModel>()
      ..locale = getItTest<AppLocalizations>();

    when(getItTest<MockLocation>().requestPermission()).thenAnswer(
      (_) async => PermissionStatus.granted,
    );
    when(getItTest<MockLocation>().hasPermission()).thenAnswer(
      (_) async => PermissionStatus.granted,
    );
    when(getItTest<MockLocation>().serviceEnabled()).thenAnswer(
      (_) async => true,
    );
    when(getItTest<MockLocation>().requestService()).thenAnswer(
      (_) async => true,
    );
  });

  group("Testing Address Validation Function", () {
    test("case if function called while the input is empty", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.addressValidation("");
      // Assert
      expect(result, viewModel.locale!.addressCantBeEmpty);
    });

    test("case if function called while the input address is invalid address",
        () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.addressValidation("john@ddd..");
      // Assert
      expect(result, viewModel.locale!.invalidAddress);
    });

    test("case if function called while the input address is valid address",
        () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.addressValidation("route alex");
      // Assert
      expect(result, isNull);
    });
  });
  group("Testing Phone Validation Function", () {
    test("case if function called while the input is empty", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.phoneValidation("");
      // Assert
      expect(result, viewModel.locale!.enterPhoneNumber);
    });

    test("case if function called while the input phone is invalid phone", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.phoneValidation("1234232");
      // Assert
      expect(result, viewModel.locale!.enterValidMobileNumber);
    });

    test("case if function called while the input phone is valid phone", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.phoneValidation("+201204984211");
      // Assert
      expect(result, isNull);
    });
  });
  group("Testing Name Validation Function", () {
    test("case if function called while the input is empty", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.nameValidation("");
      // Assert
      expect(result, viewModel.locale!.nameCantBeEmpty);
    });

    test("case if function called while the input name is invalid name", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.nameValidation("john@ddd..");
      // Assert
      expect(result, viewModel.locale!.invalidName);
    });

    test("case if function called while the input name is valid name", () {
      // Arrange
      viewModel.locale = getItTest<AppLocalizations>();
      // Act
      var result = viewModel.nameValidation("John Safwat");
      // Assert
      expect(result, isNull);
    });
  });
  group("Test View Model Initialization", () {
    test("check for view model created and initialized successfully", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      // Act
      when(getItTest<MockLocation>().requestPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(getItTest<MockLocation>().hasPermission()).thenAnswer(
        (_) async => PermissionStatus.granted,
      );
      when(getItTest<MockLocation>().serviceEnabled()).thenAnswer(
        (_) async => true,
      );
      when(getItTest<MockLocation>().requestService()).thenAnswer(
        (_) async => true,
      );
      await viewModel.doIntent(InitAddressAction());
      // assert
      expect(viewModel.cities, isNotEmpty);
      expect(viewModel.selectedCity, viewModel.cities.first);
      expect(viewModel.state.addressState, isA<DataLoadedAddressState>());
    });
  });
  group("Testing Update Validation State", () {
    test("Cities list is empty", () {
      // Arrange
      viewModel.cities = [];
      // Act
      viewModel.doIntent(UpdateFormAction());
      // Assert
      expect(viewModel.valid.value, false);
    });

    testWidgets("Form key validation have invalid input in controllers",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const AddressView(),
          ),
        ),
      );
      viewModel.phoneController.text = "";
      viewModel.nameController.text = "";
      viewModel.addressController.text = "";
      // Act
      viewModel.doIntent(UpdateFormAction());
      // Assert
      expect(viewModel.valid.value, false);
    });

    testWidgets(
        "Form key validation if password and password confirmation is the same and valid",
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const AddressView(),
          ),
        ),
      );
      viewModel.phoneController.text = "+201204984211";
      viewModel.nameController.text = "John Safwat";
      viewModel.addressController.text = "Route Alex";
      // Act
      viewModel.doIntent(UpdateFormAction());
      // Assert
      expect(viewModel.valid.value, true);
    });
  });
  group("City Selection", () {
    test("Change selected city", () {
      City newCity =
          City(name: "Alexandria", countryCode: "EG", stateCode: "02");
      viewModel.doIntent(ChangeSelectedCity(newCity));
      expect(viewModel.selectedCity, newCity);
    });
  });
  group("Testing Save Address Action", () {
    setUp(() {
      getItTest.unregister<AddressViewModel>();
      getItTest.registerSingleton(
        AddressViewModel(
          getItTest<MockAddNewAddressUseCase>(),
          getItTest<MockLocation>(),
          getItTest<MockGeoCode>(),
        ),
      );
      viewModel = getItTest<AddressViewModel>()
        ..locale = getItTest<AppLocalizations>();
    });

    test("Testing if valid value is not valid", () async {
      // act
      await viewModel.doIntent(SaveAddressAction());
      // assert
      expect(viewModel.state.navigationState, isA<InitialAddressState>());
    });

    test("Testing if valid value is true but cites is empty", () async {
      // arrange
      viewModel.valid.value = true;
      viewModel.cities = [];
      // act
      await viewModel.doIntent(SaveAddressAction());
      // assert
      expect(viewModel.state.navigationState, isA<InitialAddressState>());
    });

    testWidgets("Testing if form key current state is invalid", (tester) async {
      // arrange
      viewModel.valid.value = true;
      viewModel.cities = [
        City(name: "name", countryCode: "countryCode", stateCode: "stateCode")
      ];
      viewModel.selectedCity = viewModel.cities.first;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const AddressView(),
          ),
        ),
      );
      viewModel.phoneController.text = "";
      viewModel.nameController.text = "";
      viewModel.addressController.text = "";
      // act
      await viewModel.doIntent(SaveAddressAction());
      // assert
      expect(viewModel.state.navigationState, isA<InitialAddressState>());
    });

    testWidgets("Testing if all valid but server return failure",
        (tester) async {
      // arrange
      viewModel.valid.value = true;
      viewModel.cities = [
        City(name: "name", countryCode: "countryCode", stateCode: "stateCode")
      ];
      viewModel.selectedCity = viewModel.cities.first;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) =>
                    LanguageProvider(getItTest<MockSharedPreferences>())),
            ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => AppConfigProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: getItTest<Locale>(),
            home: const AddressView(),
          ),
        ),
      );
      viewModel.phoneController.text = "+201204984211";
      viewModel.nameController.text = "John Safwat";
      viewModel.addressController.text = "Route Alex";

      var result = Failure<List<address.Address>?>(Exception());
      provideDummy<Results<List<address.Address>?>>(result);
      // act
      when(getItTest<MockAddNewAddressUseCase>().call(any, any)).thenAnswer(
        (_) async => result,
      );
      await viewModel.doIntent(SaveAddressAction());
      // assert
      expect(viewModel.state.navigationState, isA<HideLoadingState>());
    });


    testWidgets("Testing if all valid but server return Success",
            (tester) async {
          // arrange
          viewModel.valid.value = true;
          viewModel.cities = [
            City(name: "name", countryCode: "countryCode", stateCode: "stateCode")
          ];
          viewModel.selectedCity = viewModel.cities.first;
          await tester.pumpWidget(
            MultiProvider(
              providers: [
                ChangeNotifierProvider<LanguageProvider>(
                    create: (context) =>
                        LanguageProvider(getItTest<MockSharedPreferences>())),
                ChangeNotifierProvider<AppConfigProvider>(
                    create: (context) => AppConfigProvider()),
              ],
              child: MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: getItTest<Locale>(),
                home: const AddressView(),
              ),
            ),
          );
          viewModel.phoneController.text = "+201204984211";
          viewModel.nameController.text = "John Safwat";
          viewModel.addressController.text = "Route Alex";

          var result = Success<List<address.Address>?>([]);
          provideDummy<Results<List<address.Address>?>>(result);
          // act
          when(getItTest<MockAddNewAddressUseCase>().call(any, any)).thenAnswer(
                (_) async => result,
          );
          await viewModel.doIntent(SaveAddressAction());
          // assert
          expect(viewModel.state.navigationState, isA<HideLoadingState>());
        });
  });
}
