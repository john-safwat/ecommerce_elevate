// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:geocode/geocode.dart' as _i1024;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:location/location.dart' as _i645;
import 'package:logger/logger.dart' as _i974;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../domain/use_case/get_all_products_list_use_case.dart' as _i197;
import '../../features/best_seller/presentation/view_model/best_seller_view_model.dart'
    as _i835;
import '../../features/occasions/occasions_view_model/occasions_view_model.dart'
    as _i535;
import '../../features/product_details/presentation/product_details_view_model.dart'
    as _i155;
import '../datasource_execution/datasource_execution.dart' as _i166;
import '../providers/app_config_provider.dart' as _i56;
import '../providers/language_provider.dart' as _i822;
import '../utils/app_initializer.dart' as _i348;
import 'modules/location_module.dart' as _i765;
import 'modules/logger_module.dart' as _i205;
import 'modules/network_module.dart' as _i851;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final locationModule = _$LocationModule();
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i835.BestSellerViewModel>(() => _i835.BestSellerViewModel());
    gh.factory<_i155.ProductDetailsViewModel>(
        () => _i155.ProductDetailsViewModel());
    gh.singleton<_i166.DataSourceExecution>(() => _i166.DataSourceExecution());
    gh.singleton<_i56.AppConfigProvider>(() => _i56.AppConfigProvider());
    gh.lazySingleton<_i645.Location>(() => locationModule.location);
    gh.lazySingleton<_i1024.GeoCode>(() => locationModule.geoCode);
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => networkModule.providerInterceptor());
    gh.singleton<_i822.LanguageProvider>(
        () => _i822.LanguageProvider(gh<_i460.SharedPreferences>()));
    gh.factory<_i535.OccasionsViewModel>(
        () => _i535.OccasionsViewModel(gh<_i197.GetAllProductsListUseCase>()));
    gh.lazySingleton<_i348.AppInitializer>(() => _i348.AppInitializer(
          gh<_i822.LanguageProvider>(),
          gh<_i56.AppConfigProvider>(),
          gh<_i460.SharedPreferences>(),
        ));
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$LocationModule extends _i765.LocationModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$NetworkModule extends _i851.NetworkModule {}
