// 📦 Package imports:
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/add_item_to_cart_use_case.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/get_categories_list_use_case.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/get_most_selling_products_list_use_case.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/use_case/get_occasions_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_state.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_view_model.dart';
import '../../../../../core/di/di_test.dart';
import 'home_tab_view_model_test.mocks.dart';

@GenerateMocks([
  Location,
  GeoCode,
  GetCategoriesListUseCase,
  GetOccasionsListUseCase,
  GetMostSellingProductsListUseCase
])
void main() async {
  await dependenciesSetup();

  HomeTabViewModel viewModel = getItTest<HomeTabViewModel>();
  setUp(() {
    viewModel.locale = getItTest<AppLocalizations>();
    when(getItTest<MockLocation>().serviceEnabled())
        .thenAnswer((_) async => true);
    when(getItTest<MockLocation>().requestService())
        .thenAnswer((_) async => true);
    when(getItTest<MockLocation>().hasPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
    when(getItTest<MockLocation>().requestPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
  });

  group('Location Service and Permissions', () {
    test(
      'Location service disabled and user denies enabling it',
      () async {
        when(getItTest<MockLocation>().serviceEnabled())
            .thenAnswer((_) async => false);
        when(getItTest<MockLocation>().requestService())
            .thenAnswer((_) async => false);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            getItTest<AppLocalizations>().youMustEnableLocation);
      },
    );
    test(
      'Location service disabled but user enables it',
      () async {
        when(getItTest<MockLocation>().serviceEnabled())
            .thenAnswer((_) async => false);
        when(getItTest<MockLocation>().requestService())
            .thenAnswer((_) async => true);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            isNot(equals(getItTest<AppLocalizations>().youMustEnableLocation)));
      },
    );
    test(
      'Location permissions denied and user denies permission request',
      () async {
        when(getItTest<MockLocation>().hasPermission())
            .thenAnswer((_) async => PermissionStatus.denied);
        when(getItTest<MockLocation>().requestPermission())
            .thenAnswer((_) async => PermissionStatus.denied);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(getItTest<AppLocalizations>().locationPermissionNotGranted));
      },
    );
    test(
      'Location permissions denied but user grants permission request',
      () async {
        when(getItTest<MockLocation>().hasPermission())
            .thenAnswer((_) async => PermissionStatus.denied);
        when(getItTest<MockLocation>().requestPermission())
            .thenAnswer((_) async => PermissionStatus.granted);

        await viewModel.doIntent(LoadLocationAction());

        expect(
            viewModel.locationMessage.value,
            isNot(equals(
                getItTest<AppLocalizations>().locationPermissionNotGranted)));
      },
    );
    test(
      'Location permissions permanently denied',
      () async {
        when(getItTest<MockLocation>().hasPermission())
            .thenAnswer((_) async => PermissionStatus.deniedForever);
        when(getItTest<MockLocation>().requestPermission())
            .thenAnswer((_) async => PermissionStatus.denied);

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(getItTest<AppLocalizations>().locationPermissionNotGranted));
      },
    );
    test(
      'Successful location data retrieval',
      () async {
        when(getItTest<MockLocation>().getLocation()).thenAnswer(
          (_) async => LocationData.fromMap(
            {
              'latitude': 12,
              'longitude': 12,
            },
          ),
        );

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            isNot(equals(getItTest<AppLocalizations>().getLocation)));
      },
    );
    test(
      'Error occurs during location data retrieval',
      () async {
        when(getItTest<MockLocation>().getLocation()).thenAnswer(
          (_) async => LocationData.fromMap({}),
        );
        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(getItTest<AppLocalizations>().cantFindYourLocation));
      },
    );
    test(
      'Location data contains null values for latitude and longitude',
      () async {
        when(getItTest<MockLocation>().getLocation()).thenAnswer(
          (_) async => LocationData.fromMap({}),
        );
        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(getItTest<AppLocalizations>().cantFindYourLocation));
      },
    );
    test(
      'Successful reverse geocoding',
      () async {
        when(getItTest<MockLocation>().getLocation()).thenAnswer(
          (_) async => LocationData.fromMap(
            {
              'latitude': 12.0,
              'longitude': 12.0,
            },
          ),
        );

        when(getItTest<MockGeoCode>()
                .reverseGeocoding(latitude: 12.0, longitude: 12.0))
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
        when(getItTest<MockLocation>().getLocation()).thenAnswer(
          (_) async => LocationData.fromMap(
            {
              'latitude': 12.0,
              'longitude': 12.0,
            },
          ),
        );

        when(getItTest<MockGeoCode>()
                .reverseGeocoding(latitude: 12, longitude: 12))
            .thenAnswer(
          (_) async => Address(),
        );

        await viewModel.doIntent(LoadLocationAction());

        expect(viewModel.locationMessage.value,
            equals(getItTest<AppLocalizations>().cantFindYourLocation));
      },
    );
  });
  group("Data Loading", () {
    test("emits success states for all responses", () async {
      var occasionsResponse = Success<List<Occasion>?>([]);
      var categoriesResponse = Success<List<Category>?>([]);
      var productsResponse = Success<List<Product>?>([]);

      provideDummy<Results<List<Occasion>?>>(occasionsResponse);
      provideDummy<Results<List<Category>?>>(categoriesResponse);
      provideDummy<Results<List<Product>?>>(productsResponse);

      when(viewModel.getOccasionsListUseCase())
          .thenAnswer((_) async => occasionsResponse);
      when(viewModel.getCategoriesListUseCase())
          .thenAnswer((_) async => categoriesResponse);
      when(viewModel.getMostSellingProductsListUseCase())
          .thenAnswer((_) async => productsResponse);

      await viewModel.doIntent(LoadDataAction());

      expect(viewModel.state.categoriesState,
          isA<HomeTabLoadingSuccessState<List<Category>?>>());
      expect(viewModel.state.occasionsState,
          isA<HomeTabLoadingSuccessState<List<Occasion>?>>());
      expect(viewModel.state.productsState,
          isA<HomeTabLoadingSuccessState<List<Product>?>>());
    });

    test("emits failure states when use cases fail", () async {
      var occasionsResponse = Failure<List<Occasion>?>(Exception());
      var categoriesResponse = Failure<List<Category>?>(Exception());
      var productsResponse = Failure<List<Product>?>(Exception());

      provideDummy<Results<List<Occasion>?>>(occasionsResponse);
      provideDummy<Results<List<Category>?>>(categoriesResponse);
      provideDummy<Results<List<Product>?>>(productsResponse);

      when(viewModel.getOccasionsListUseCase())
          .thenAnswer((_) async => occasionsResponse);
      when(viewModel.getCategoriesListUseCase())
          .thenAnswer((_) async => categoriesResponse);
      when(viewModel.getMostSellingProductsListUseCase())
          .thenAnswer((_) async => productsResponse);

      await viewModel.doIntent(LoadDataAction());

      expect(viewModel.state.categoriesState, isA<HomeTabLoadingFailState>());
      expect(viewModel.state.occasionsState, isA<HomeTabLoadingFailState>());
      expect(viewModel.state.productsState, isA<HomeTabLoadingFailState>());
    });


    test("emits mixed success and failure states", () async {
      var occasionsResponse = Success<List<Occasion>?>([]);
      var categoriesResponse = Failure<List<Category>?>(Exception());
      var productsResponse = Failure<List<Product>?>(Exception());

      provideDummy<Results<List<Occasion>?>>(occasionsResponse);
      provideDummy<Results<List<Category>?>>(categoriesResponse);
      provideDummy<Results<List<Product>?>>(productsResponse);

      when(viewModel.getOccasionsListUseCase())
          .thenAnswer((_) async => occasionsResponse);
      when(viewModel.getCategoriesListUseCase())
          .thenAnswer((_) async => categoriesResponse);
      when(viewModel.getMostSellingProductsListUseCase())
          .thenAnswer((_) async => productsResponse);

      await viewModel.doIntent(LoadDataAction());

      expect(viewModel.state.categoriesState, isA<HomeTabLoadingFailState>());
      expect(viewModel.state.occasionsState, isA<HomeTabLoadingSuccessState<List<Occasion>?>>());
      expect(viewModel.state.productsState, isA<HomeTabLoadingFailState>());
    });

  });
}
