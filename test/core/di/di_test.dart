// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/features/home/data/datasource/contract/categories_remote_datasource.dart';
import 'package:ecommerce_elevate/features/home/data/datasource/impl/categories_remote_datasource_impl.dart';
// 🐦 Flutter imports:
import 'package:ecommerce_elevate/features/home/data/repository/categories_repository_impl.dart';
import 'package:ecommerce_elevate/features/home/domain/repository/categories_repository.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_view_model.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasource/impl/categories_remote_datasource_test.mocks.dart';
import '../../features/home/domain/repository/categories_repository_test.mocks.dart';
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
  getItTest.registerSingleton<CategoriesRemoteDatasource>(
    CategoriesRemoteDatasourceImpl(
      getItTest<MockCategoriesRetrofitClient>(),
      getItTest<MockDataSourceExecution>(),
    ),
  );

  getItTest.registerSingleton<MockCategoriesRemoteDatasource>(
    MockCategoriesRemoteDatasource(),
  );
  getItTest.registerSingleton<CategoriesRepository>(
    CategoriesRepositoryImpl(getItTest<MockCategoriesRemoteDatasource>()),
  );
}
