import 'dart:ui';

import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_tab_view_model_test.mocks.dart';

@GenerateMocks([Location, GeoCode])
void main() async {
  MockLocation mockLocation = MockLocation();
  MockGeoCode mockGeoCode = MockGeoCode();
  HomeTabViewModel viewModel = HomeTabViewModel(mockLocation, mockGeoCode);
  AppLocalizations localizations =
      await AppLocalizations.delegate.load(const Locale("en"));

  setUp(() {
    viewModel.locale = localizations;
    when(mockLocation.serviceEnabled()).thenAnswer((_) async => true);
    when(mockLocation.requestService()).thenAnswer((_) async => true);
    when(mockLocation.hasPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
    when(mockLocation.requestPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
  });

  group('Location Service and Permissions', () {
    test(
      'Location service disabled and user denies enabling it',
      () async {
        when(mockLocation.serviceEnabled()).thenAnswer((_) async => false);
        when(mockLocation.requestService()).thenAnswer((_) async => false);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            localizations.youMustEnableLocation);
      },
    );
    test(
      'Location service disabled but user enables it',
      () async {
        when(mockLocation.serviceEnabled()).thenAnswer((_) async => false);
        when(mockLocation.requestService()).thenAnswer((_) async => true);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            isNot(equals(localizations.youMustEnableLocation)));
      },
    );
    test(
      'Location permissions denied and user denies permission request',
      () async {
        when(mockLocation.hasPermission())
            .thenAnswer((_) async => PermissionStatus.denied);
        when(mockLocation.requestPermission())
            .thenAnswer((_) async => PermissionStatus.denied);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(localizations.locationPermissionNotGranted));
      },
    );
    test(
      'Location permissions denied but user grants permission request',
      () async {
        when(mockLocation.hasPermission())
            .thenAnswer((_) async => PermissionStatus.denied);
        when(mockLocation.requestPermission())
            .thenAnswer((_) async => PermissionStatus.granted);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            isNot(equals(localizations.locationPermissionNotGranted)));
      },
    );
    test(
      'Location permissions permanently denied',
      () async {
        when(mockLocation.hasPermission())
            .thenAnswer((_) async => PermissionStatus.deniedForever);
        when(mockLocation.requestPermission())
            .thenAnswer((_) async => PermissionStatus.denied);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(localizations.locationPermissionNotGranted));
      },
    );
    test(
      'Successful location data retrieval',
      () async {
        when(mockLocation.getLocation()).thenAnswer(
          (_) async => LocationData.fromMap(
            {
              'latitude': 12,
              'longitude': 12,
            },
          ),
        );

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            isNot(equals(localizations.getLocation)));
      },
    );
    test(
      'Error occurs during location data retrieval',
      () async {
        when(mockLocation.getLocation()).thenAnswer(
          (_) async => LocationData.fromMap({}),
        );
        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(localizations.cantFindYourLocation));
      },
    );
    test(
      'Location data contains null values for latitude and longitude',
      () async {
        when(mockLocation.getLocation()).thenAnswer(
          (_) async => LocationData.fromMap({}),
        );
        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(localizations.cantFindYourLocation));
      },
    );
    test(
      'Successful reverse geocoding',
      () async {
        when(mockLocation.getLocation()).thenAnswer(
          (_) async => LocationData.fromMap(
            {
              'latitude': 12.0,
              'longitude': 12.0,
            },
          ),
        );

        when(mockGeoCode.reverseGeocoding(latitude: 12.0, longitude: 12.0))
            .thenAnswer(
          (_) async => Address(
            streetNumber: 123,
            streetAddress: 'Main Street',
          ),
        );

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value, equals("123 - Main Street"));
      },
    );
    test(
      'Reverse geocoding fails with an exception',
      () async {
        when(mockLocation.getLocation()).thenAnswer(
          (_) async => LocationData.fromMap(
            {
              'latitude': 12.0,
              'longitude': 12.0,
            },
          ),
        );

        when(mockGeoCode.reverseGeocoding(latitude: 12, longitude: 12))
            .thenAnswer(
          (_) async => Address(),
        );

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(localizations.cantFindYourLocation));
      },
    );
  });
}
