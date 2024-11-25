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

import '../../features/auth/data/api/auth_retrofit_client.dart' as _i187;
import '../../features/auth/data/datasource/contract/auth_local_datasource.dart'
    as _i1071;
import '../../features/auth/data/datasource/contract/auth_remote_datasource.dart'
    as _i1070;
import '../../features/auth/data/datasource/impl/auth_local_datasource_impl.dart'
    as _i909;
import '../../features/auth/data/datasource/impl/auth_remote_datasource_impl.dart'
    as _i81;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_case/delete_token_use_case.dart'
    as _i376;
import '../../features/auth/domain/use_case/forget_password_use_case.dart'
    as _i90;
import '../../features/auth/domain/use_case/login_user_use_case.dart' as _i697;
import '../../features/auth/domain/use_case/reset_password_use_case.dart'
    as _i149;
import '../../features/auth/domain/use_case/signup_user_use_case.dart' as _i529;
import '../../features/auth/domain/use_case/verify_reset_code_use_case.dart'
    as _i660;
import '../../features/auth/presentation/forget_password/forget_password_view_model.dart'
    as _i599;
import '../../features/auth/presentation/login/login_view_model.dart' as _i225;
import '../../features/auth/presentation/otp_verify/otp_verify_view_model.dart'
    as _i1033;
import '../../features/auth/presentation/reset_password/reset_password_view_model.dart'
    as _i974;
import '../../features/auth/presentation/signup/signup_view_model.dart'
    as _i1055;
import '../../features/home/best_seller/presentation/view_model/best_seller_view_model.dart'
    as _i232;
import '../../features/home/data/api/categories/categories_retrofit_client.dart'
    as _i186;
import '../../features/home/data/api/occasions/occasions_retrofit_client.dart'
    as _i207;
import '../../features/home/data/api/products/products_retrofit_client.dart'
    as _i202;
import '../../features/home/data/datasource/contract/categories_remote_datasource.dart'
    as _i542;
import '../../features/home/data/datasource/contract/occasions_remote_datasource.dart'
    as _i96;
import '../../features/home/data/datasource/contract/products_remote_datasource.dart'
    as _i603;
import '../../features/home/data/datasource/impl/categories_remote_datasource_impl.dart'
    as _i948;
import '../../features/home/data/datasource/impl/occasions_remote_datasource_impl.dart'
    as _i290;
import '../../features/home/data/datasource/impl/products_remote_datasource_impl.dart'
    as _i868;
import '../../features/home/data/repository/categories_repository_impl.dart'
    as _i199;
import '../../features/home/data/repository/occasions_repository_impl.dart'
    as _i17;
import '../../features/home/data/repository/products_repository_impl.dart'
    as _i748;
import '../../features/home/domain/repository/categories_repository.dart'
    as _i403;
import '../../features/home/domain/repository/occasions_repository.dart'
    as _i860;
import '../../features/home/domain/repository/products_repository.dart'
    as _i195;
import '../../features/home/domain/use_case/get_categories_list_use_case.dart'
    as _i348;
import '../../features/home/domain/use_case/get_most_selling_products_list_use_case.dart'
    as _i842;
import '../../features/home/domain/use_case/get_occasions_list_use_case.dart'
    as _i64;
import '../../features/home/presentation/tabs/home/view_model/home_tab_view_model.dart'
    as _i742;
import '../../features/home/presentation/view_model/home_view_model.dart'
    as _i77;
import '../../features/home/product_details/presentation/product_details_view_model.dart'
    as _i101;
import '../datasource_execution/datasource_execution.dart' as _i166;
import '../modules/location_module.dart' as _i917;
import '../modules/logger_module.dart' as _i774;
import '../modules/network_module.dart' as _i184;
import '../modules/shared_preferences_module.dart' as _i744;
import '../providers/app_config_provider.dart' as _i56;
import '../providers/language_provider.dart' as _i822;
import '../utils/app_initializer.dart' as _i348;

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
    gh.factory<_i232.BestSellerViewModel>(() => _i232.BestSellerViewModel());
    gh.factory<_i101.ProductDetailsViewModel>(
        () => _i101.ProductDetailsViewModel());
    gh.factory<_i77.HomeViewModel>(() => _i77.HomeViewModel());
    gh.singleton<_i56.AppConfigProvider>(() => _i56.AppConfigProvider());
    gh.singleton<_i166.DataSourceExecution>(() => _i166.DataSourceExecution());
    gh.lazySingleton<_i645.Location>(() => locationModule.location);
    gh.lazySingleton<_i1024.GeoCode>(() => locationModule.geoCode);
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => networkModule.providerInterceptor());
    gh.singleton<_i202.ProductsRetrofitClient>(
        () => _i202.ProductsRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i207.OccasionsRetrofitClient>(
        () => _i207.OccasionsRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i186.CategoriesRetrofitClient>(
        () => _i186.CategoriesRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i187.AuthRetrofitClient>(
        () => _i187.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i96.OccasionsRemoteDatasource>(
        () => _i290.OccasionsRemoteDatasourceImpl(
              gh<_i207.OccasionsRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i1071.AuthLocalDatasource>(
        () => _i909.AuthLocalDatasourceImpl(gh<_i460.SharedPreferences>()));
    gh.singleton<_i822.LanguageProvider>(
        () => _i822.LanguageProvider(gh<_i460.SharedPreferences>()));
    gh.factory<_i542.CategoriesRemoteDatasource>(
        () => _i948.CategoriesRemoteDatasourceImpl(
              gh<_i186.CategoriesRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i860.OccasionsRepository>(() =>
        _i17.OccasionsRepositoryImpl(gh<_i96.OccasionsRemoteDatasource>()));
    gh.factory<_i603.ProductsRemoteDatasource>(
        () => _i868.ProductsRemoteDatasourceImpl(
              gh<_i202.ProductsRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i1070.AuthRemoteDatasource>(() => _i81.AuthRemoteDatasourceImpl(
          gh<_i187.AuthRetrofitClient>(),
          gh<_i166.DataSourceExecution>(),
        ));
    gh.factory<_i195.ProductsRepository>(() =>
        _i748.ProductsRepositoryImpl(gh<_i603.ProductsRemoteDatasource>()));
    gh.lazySingleton<_i348.AppInitializer>(() => _i348.AppInitializer(
          gh<_i822.LanguageProvider>(),
          gh<_i56.AppConfigProvider>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i403.CategoriesRepository>(() =>
        _i199.CategoriesRepositoryImpl(gh<_i542.CategoriesRemoteDatasource>()));
    gh.factory<_i64.GetOccasionsListUseCase>(
        () => _i64.GetOccasionsListUseCase(gh<_i860.OccasionsRepository>()));
    gh.factory<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl(
          gh<_i1070.AuthRemoteDatasource>(),
          gh<_i1071.AuthLocalDatasource>(),
        ));
    gh.factory<_i842.GetMostSellingProductsListUseCase>(() =>
        _i842.GetMostSellingProductsListUseCase(
            gh<_i195.ProductsRepository>()));
    gh.factory<_i348.GetCategoriesListUseCase>(
        () => _i348.GetCategoriesListUseCase(gh<_i403.CategoriesRepository>()));
    gh.factory<_i742.HomeTabViewModel>(() => _i742.HomeTabViewModel(
          gh<_i348.GetCategoriesListUseCase>(),
          gh<_i842.GetMostSellingProductsListUseCase>(),
          gh<_i64.GetOccasionsListUseCase>(),
          gh<_i645.Location>(),
          gh<_i1024.GeoCode>(),
        ));
    gh.factory<_i90.ForgetPasswordUseCase>(
        () => _i90.ForgetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i529.SignupUserUseCase>(
        () => _i529.SignupUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i376.DeleteTokenUseCase>(
        () => _i376.DeleteTokenUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i1055.SignupViewModel>(
        () => _i1055.SignupViewModel(gh<_i529.SignupUserUseCase>()));
    gh.factory<_i660.VerifyResetPasswordUseCase>(
        () => _i660.VerifyResetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i697.LoginUserUseCase>(
        () => _i697.LoginUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i149.ResetPasswordUseCase>(
        () => _i149.ResetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i974.ResetPasswordViewModel>(
        () => _i974.ResetPasswordViewModel(gh<_i149.ResetPasswordUseCase>()));
    gh.factory<_i599.ForgetPasswordViewModel>(
        () => _i599.ForgetPasswordViewModel(gh<_i90.ForgetPasswordUseCase>()));
    gh.factory<_i225.LoginViewModel>(
        () => _i225.LoginViewModel(gh<_i697.LoginUserUseCase>()));
    gh.factory<_i1033.OtpVerifyViewModel>(() => _i1033.OtpVerifyViewModel(
          gh<_i660.VerifyResetPasswordUseCase>(),
          gh<_i90.ForgetPasswordUseCase>(),
        ));
    return this;
  }
}

class _$SharedPreferencesModule extends _i744.SharedPreferencesModule {}

class _$LocationModule extends _i917.LocationModule {}

class _$LoggerModule extends _i774.LoggerModule {}

class _$NetworkModule extends _i184.NetworkModule {}
