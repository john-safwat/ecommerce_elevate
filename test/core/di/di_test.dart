// 🐦 Flutter imports:

import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_view_model.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasource/impl/categories_remote_datasource_impl_test.mocks.dart';
import '../../features/home/data/datasource/impl/occasions_remote_datasource_impl_test.mocks.dart';
import '../../features/home/data/datasource/impl/products_remote_datasource_impl_test.mocks.dart';
import '../../features/home/data/repository/categories_repository_impl_test.mocks.dart';
import '../../features/home/data/repository/occasions_repository_impl_test.mocks.dart';
import '../../features/home/data/repository/products_repository_impl_test.mocks.dart';
import '../../features/home/domain/use_case/get_categories_list_use_case_test.mocks.dart';
import '../../features/home/domain/use_case/get_most_selling_products_list_use_case_test.mocks.dart';
import '../../features/home/domain/use_case/get_occasions_list_use_case_test.mocks.dart';
import '../../features/home/tabs/home/view_model/home_tab_view_model_test.mocks.dart';
import '../datasource_execution/mock_datasource_execution.dart';

final GetIt getItTest = GetIt.I;

Future<void> dependenciesSetup() async {
  getItTest.registerSingleton<MockLocation>(MockLocation());
  getItTest.registerSingleton<MockGeoCode>(MockGeoCode());
  getItTest.registerSingleton<MockGetCategoriesListUseCase>(
      MockGetCategoriesListUseCase());
  getItTest.registerSingleton<MockGetMostSellingProductsListUseCase>(
      MockGetMostSellingProductsListUseCase());
  getItTest.registerSingleton<MockGetOccasionsListUseCase>(
      MockGetOccasionsListUseCase());
  getItTest.registerSingleton<HomeTabViewModel>(
    HomeTabViewModel(
      getItTest<MockGetCategoriesListUseCase>(),
      getItTest<MockGetMostSellingProductsListUseCase>(),
      getItTest<MockGetOccasionsListUseCase>(),
      getItTest<MockLocation>(),
      getItTest<MockGeoCode>(),
    ),
  );
  getItTest.registerSingletonAsync<AppLocalizations>(
    () async => await AppLocalizations.delegate.load(
      const Locale("en"),
    ),
  );
  await getItTest.isReady<AppLocalizations>();
  getItTest.registerSingleton<MockCategoriesRetrofitClient>(
    MockCategoriesRetrofitClient(),
  );
  getItTest.registerSingleton<MockDataSourceExecution>(
    MockDataSourceExecution(),
  );

  getItTest.registerSingleton<MockCategoriesRemoteDatasource>(
    MockCategoriesRemoteDatasource(),
  );

  getItTest.registerSingleton<MockOccasionsRetrofitClient>(
      MockOccasionsRetrofitClient());

  getItTest.registerSingleton<MockProductsRetrofitClient>(
      MockProductsRetrofitClient());
  getItTest.registerSingleton<MockOccasionsRemoteDatasource>(
      MockOccasionsRemoteDatasource());
  getItTest.registerSingleton<MockProductsRemoteDatasourceImpl>(
      MockProductsRemoteDatasourceImpl());
  getItTest
      .registerSingleton<MockCategoriesRepository>(MockCategoriesRepository());
  getItTest
      .registerSingleton<MockOccasionsRepository>(MockOccasionsRepository());
  getItTest.registerSingleton<MockProductsRepository>(MockProductsRepository());
}
