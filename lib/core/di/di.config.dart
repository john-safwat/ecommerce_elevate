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

import '../../data/api/addresses/addresses_retrofit_client.dart' as _i677;
import '../../data/api/auth/auth_retrofit_client.dart' as _i797;
import '../../data/api/cart/cart_retrofit_client.dart' as _i112;
import '../../data/api/categories/categories_retrofit_client.dart' as _i703;
import '../../data/api/get_user_logged_info/get_user_logged_info_retrofit_client.dart'
    as _i627;
import '../../data/api/logout/logout_retrofit_client.dart' as _i353;
import '../../data/api/occasions/occasions_retrofit_client.dart' as _i835;
import '../../data/api/order/orders_retrofit_client.dart' as _i355;
import '../../data/api/products/products_retrofit_client.dart' as _i361;
import '../../data/datasource/contract/addresses_remote_datasource.dart'
    as _i653;
import '../../data/datasource/contract/auth_local_datasource.dart' as _i488;
import '../../data/datasource/contract/auth_remote_datasource.dart' as _i912;
import '../../data/datasource/contract/cart_remote_datasource.dart' as _i41;
import '../../data/datasource/contract/categories_remote_datasource.dart'
    as _i1033;
import '../../data/datasource/contract/logged_user_info_remote_datasource.dart'
    as _i284;
import '../../data/datasource/contract/logout_remote_datasource.dart' as _i221;
import '../../data/datasource/contract/occasions_remote_datasource.dart'
    as _i283;
import '../../data/datasource/contract/orders_remote_datasource.dart' as _i877;
import '../../data/datasource/contract/products_remote_datasource.dart'
    as _i568;
import '../../data/datasource/impl/addresses_remote_datasource_impl.dart'
    as _i26;
import '../../data/datasource/impl/auth_local_datasource_impl.dart' as _i141;
import '../../data/datasource/impl/auth_remote_datasource_impl.dart' as _i939;
import '../../data/datasource/impl/cart_remote_datasource_impl.dart' as _i701;
import '../../data/datasource/impl/categories_remote_datasource_impl.dart'
    as _i168;
import '../../data/datasource/impl/logged_user_info_remote_datasource_impl.dart'
    as _i141;
import '../../data/datasource/impl/logout_remote_datasource_impl.dart' as _i398;
import '../../data/datasource/impl/occasions_remote_datasource_impl.dart'
    as _i791;
import '../../data/datasource/impl/orders_remote_datasource_impl.dart' as _i301;
import '../../data/datasource/impl/products_remote_datasource_impl.dart'
    as _i421;
import '../../data/repository/addresses_repository_impl.dart' as _i1009;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/cart_repository_impl.dart' as _i942;
import '../../data/repository/categories_repository_impl.dart' as _i958;
import '../../data/repository/logged_user_info_repository_impl.dart' as _i233;
import '../../data/repository/logout_repository_impl.dart' as _i613;
import '../../data/repository/occasions_repository_impl.dart' as _i544;
import '../../data/repository/orders_repository_impl.dart' as _i291;
import '../../data/repository/products_repository_impl.dart' as _i1005;
import '../../domain/repository/addresses_repository.dart' as _i562;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/repository/cart_repository.dart' as _i461;
import '../../domain/repository/categories_repository.dart' as _i723;
import '../../domain/repository/logged_user_info_repository.dart' as _i1024;
import '../../domain/repository/logout_repository.dart' as _i984;
import '../../domain/repository/occasions_repository.dart' as _i431;
import '../../domain/repository/orders_repository.dart' as _i126;
import '../../domain/repository/products_repository.dart' as _i150;
import '../../domain/use_case/add_item_to_cart_use_case.dart' as _i530;
import '../../domain/use_case/add_new_address_use_case.dart' as _i834;
import '../../domain/use_case/change_password_use_case.dart' as _i406;
import '../../domain/use_case/create_cache_order_use_case.dart' as _i1009;
import '../../domain/use_case/delete_product_from_cart_use_case.dart' as _i591;
import '../../domain/use_case/delete_token_use_case.dart' as _i714;
import '../../domain/use_case/forget_password_use_case.dart' as _i742;
import '../../domain/use_case/get_all_address_use_case.dart' as _i418;
import '../../domain/use_case/get_all_products_list_use_case.dart' as _i197;
import '../../domain/use_case/get_categories_list_use_case.dart' as _i164;
import '../../domain/use_case/get_most_selling_products_list_use_case.dart'
    as _i170;
import '../../domain/use_case/get_occasions_list_use_case.dart' as _i1017;
import '../../domain/use_case/get_user_cart_use_case.dart' as _i172;
import '../../domain/use_case/logged_user_info_use_case.dart' as _i10;
import '../../domain/use_case/login_user_use_case.dart' as _i678;
import '../../domain/use_case/logout_user_use_case.dart' as _i748;
import '../../domain/use_case/reset_password_use_case.dart' as _i16;
import '../../domain/use_case/signup_user_use_case.dart' as _i205;
import '../../domain/use_case/update_cart_product_use_case.dart' as _i496;
import '../../domain/use_case/verify_reset_code_use_case.dart' as _i499;
import '../../features/address/address_view_model.dart' as _i413;
import '../../features/best_seller/presentation/view_model/best_seller_view_model.dart'
    as _i835;
import '../../features/change_password/change_password_view_model.dart'
    as _i532;
import '../../features/checkout/checkout_view_model.dart' as _i1061;
import '../../features/forget_password/forget_password_view_model.dart' as _i45;
import '../../features/home/tabs/cart/view_model/cart_tab_view_model.dart'
    as _i282;
import '../../features/home/tabs/categories/view_model/categories_view_model.dart'
    as _i819;
import '../../features/home/tabs/home/view_model/home_tab_view_model.dart'
    as _i183;
import '../../features/home/tabs/profile/view_model/profile_tab_view_model.dart'
    as _i317;
import '../../features/home/view_model/home_view_model.dart' as _i656;
import '../../features/login/login_view_model.dart' as _i237;
import '../../features/occasions/occasions_view_model/occasions_view_model.dart'
    as _i535;
import '../../features/otp_verify/otp_verify_view_model.dart' as _i678;
import '../../features/product_details/presentation/product_details_view_model.dart'
    as _i155;
import '../../features/reset_password/reset_password_view_model.dart' as _i735;
import '../../features/signup/signup_view_model.dart' as _i512;
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
    gh.factory<_i656.HomeViewModel>(() => _i656.HomeViewModel());
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
    gh.singleton<_i677.AddressesRetrofitClient>(
        () => _i677.AddressesRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i797.AuthRetrofitClient>(
        () => _i797.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i112.CartRetrofitClient>(
        () => _i112.CartRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i703.CategoriesRetrofitClient>(
        () => _i703.CategoriesRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i627.GetUserLoggedInfoRetrofitClient>(
        () => _i627.GetUserLoggedInfoRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i353.LogoutRetrofitClient>(
        () => _i353.LogoutRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i835.OccasionsRetrofitClient>(
        () => _i835.OccasionsRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i361.ProductsRetrofitClient>(
        () => _i361.ProductsRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i355.OrdersRetrofitClient>(
        () => _i355.OrdersRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i488.AuthLocalDatasource>(
        () => _i141.AuthLocalDatasourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i283.OccasionsRemoteDatasource>(
        () => _i791.OccasionsRemoteDatasourceImpl(
              gh<_i835.OccasionsRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.singleton<_i822.LanguageProvider>(
        () => _i822.LanguageProvider(gh<_i460.SharedPreferences>()));
    gh.factory<_i912.AuthRemoteDatasource>(() => _i939.AuthRemoteDatasourceImpl(
          gh<_i797.AuthRetrofitClient>(),
          gh<_i166.DataSourceExecution>(),
        ));
    gh.factory<_i568.ProductsDatasource>(
        () => _i421.ProductsRemoteDatasourceImpl(
              gh<_i361.ProductsRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i431.OccasionsRepository>(() =>
        _i544.OccasionsRepositoryImpl(gh<_i283.OccasionsRemoteDatasource>()));
    gh.factory<_i221.LogoutRemoteDatasource>(
        () => _i398.LogoutRemoteDatasourceImpl(
              gh<_i353.LogoutRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i41.CartRemoteDatasource>(() => _i701.CartRemoteDatasourceImpl(
          gh<_i166.DataSourceExecution>(),
          gh<_i112.CartRetrofitClient>(),
        ));
    gh.singleton<_i530.AddItemToCartUseCase>(
        () => _i530.AddItemToCartUseCase(gh<_i41.CartRemoteDatasource>()));
    gh.factory<_i461.CartRepository>(
        () => _i942.CartRepositoryImpl(gh<_i41.CartRemoteDatasource>()));
    gh.factory<_i877.OrdersRemoteDatasource>(
        () => _i301.OrdersRemoteDatasourceImpl(
              gh<_i355.OrdersRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i614.AuthRepository>(() => _i581.AuthRepositoryImpl(
          gh<_i912.AuthRemoteDatasource>(),
          gh<_i488.AuthLocalDatasource>(),
        ));
    gh.factory<_i653.AddressesRemoteDatasource>(
        () => _i26.AddressesRemoteDatasourceImpl(
              gh<_i677.AddressesRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i742.ForgetPasswordUseCase>(
        () => _i742.ForgetPasswordUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i205.SignupUserUseCase>(
        () => _i205.SignupUserUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i562.AddressesRepository>(() =>
        _i1009.AddressesRepositoryImpl(gh<_i653.AddressesRemoteDatasource>()));
    gh.lazySingleton<_i348.AppInitializer>(() => _i348.AppInitializer(
          gh<_i822.LanguageProvider>(),
          gh<_i56.AppConfigProvider>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i512.SignupViewModel>(
        () => _i512.SignupViewModel(gh<_i205.SignupUserUseCase>()));
    gh.factory<_i284.LoggedUserInfoRemoteDatasource>(
        () => _i141.LoggedUserInfoRemoteDatasourceImpl(
              gh<_i627.GetUserLoggedInfoRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i1033.CategoriesRemoteDatasource>(
        () => _i168.CategoriesRemoteDatasourceImpl(
              gh<_i703.CategoriesRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i984.LogoutRepository>(
        () => _i613.LogoutRepositoryImpl(gh<_i221.LogoutRemoteDatasource>()));
    gh.factory<_i150.ProductsRepository>(
        () => _i1005.ProductsRepositoryImpl(gh<_i568.ProductsDatasource>()));
    gh.factory<_i1017.GetOccasionsListUseCase>(
        () => _i1017.GetOccasionsListUseCase(gh<_i431.OccasionsRepository>()));
    gh.factory<_i1024.LoggedUserInfoRepository>(() =>
        _i233.LoggedUserInfoRepositoryImpl(
            gh<_i284.LoggedUserInfoRemoteDatasource>()));
    gh.factory<_i45.ForgetPasswordViewModel>(
        () => _i45.ForgetPasswordViewModel(gh<_i742.ForgetPasswordUseCase>()));
    gh.factory<_i591.DeleteProductFromCartUseCase>(
        () => _i591.DeleteProductFromCartUseCase(gh<_i461.CartRepository>()));
    gh.factory<_i172.GetUserCartUseCase>(
        () => _i172.GetUserCartUseCase(gh<_i461.CartRepository>()));
    gh.factory<_i496.UpdateCartProductUseCase>(
        () => _i496.UpdateCartProductUseCase(gh<_i461.CartRepository>()));
    gh.factory<_i126.OrdersRepository>(
        () => _i291.OrdersRepositoryImpl(gh<_i877.OrdersRemoteDatasource>()));
    gh.factory<_i714.DeleteTokenUseCase>(
        () => _i714.DeleteTokenUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i406.ChangePasswordUseCase>(
        () => _i406.ChangePasswordUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i678.LoginUserUseCase>(
        () => _i678.LoginUserUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i16.ResetPasswordUseCase>(
        () => _i16.ResetPasswordUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i499.VerifyResetPasswordUseCase>(
        () => _i499.VerifyResetPasswordUseCase(gh<_i614.AuthRepository>()));
    gh.factory<_i834.AddNewAddressUseCase>(
        () => _i834.AddNewAddressUseCase(gh<_i562.AddressesRepository>()));
    gh.factory<_i418.GetAllAddressUseCase>(
        () => _i418.GetAllAddressUseCase(gh<_i562.AddressesRepository>()));
    gh.factory<_i413.AddressViewModel>(() => _i413.AddressViewModel(
          gh<_i834.AddNewAddressUseCase>(),
          gh<_i645.Location>(),
          gh<_i1024.GeoCode>(),
        ));
    gh.factory<_i170.GetMostSellingProductsListUseCase>(() =>
        _i170.GetMostSellingProductsListUseCase(
            gh<_i150.ProductsRepository>()));
    gh.factory<_i723.CategoriesRepository>(() => _i958.CategoriesRepositoryImpl(
        gh<_i1033.CategoriesRemoteDatasource>()));
    gh.factory<_i748.LogoutUserUseCase>(
        () => _i748.LogoutUserUseCase(gh<_i984.LogoutRepository>()));
    gh.factory<_i197.GetAllProductsListUseCase>(
        () => _i197.GetAllProductsListUseCase(gh<_i150.ProductsRepository>()));
    gh.factory<_i1009.CreateCacheOrderUseCase>(
        () => _i1009.CreateCacheOrderUseCase(gh<_i126.OrdersRepository>()));
    gh.factory<_i532.ChangePasswordViewModel>(
        () => _i532.ChangePasswordViewModel(gh<_i406.ChangePasswordUseCase>()));
    gh.factory<_i10.LoggedUserInfoUseCase>(() =>
        _i10.LoggedUserInfoUseCase(gh<_i1024.LoggedUserInfoRepository>()));
    gh.factory<_i282.CartTabViewModel>(() => _i282.CartTabViewModel(
          gh<_i172.GetUserCartUseCase>(),
          gh<_i496.UpdateCartProductUseCase>(),
          gh<_i591.DeleteProductFromCartUseCase>(),
          gh<_i645.Location>(),
          gh<_i1024.GeoCode>(),
        ));
    gh.factory<_i164.GetCategoriesListUseCase>(
        () => _i164.GetCategoriesListUseCase(gh<_i723.CategoriesRepository>()));
    gh.factory<_i535.OccasionsViewModel>(
        () => _i535.OccasionsViewModel(gh<_i197.GetAllProductsListUseCase>()));
    gh.factory<_i237.LoginViewModel>(
        () => _i237.LoginViewModel(gh<_i678.LoginUserUseCase>()));
    gh.factory<_i678.OtpVerifyViewModel>(() => _i678.OtpVerifyViewModel(
          gh<_i499.VerifyResetPasswordUseCase>(),
          gh<_i742.ForgetPasswordUseCase>(),
        ));
    gh.factory<_i735.ResetPasswordViewModel>(
        () => _i735.ResetPasswordViewModel(gh<_i16.ResetPasswordUseCase>()));
    gh.factory<_i1061.CheckoutViewModel>(() => _i1061.CheckoutViewModel(
          gh<_i418.GetAllAddressUseCase>(),
          gh<_i1009.CreateCacheOrderUseCase>(),
        ));
    gh.factory<_i317.ProfileTabViewModel>(() => _i317.ProfileTabViewModel(
          gh<_i10.LoggedUserInfoUseCase>(),
          gh<_i748.LogoutUserUseCase>(),
        ));
    gh.factory<_i819.CategoriesViewModel>(() => _i819.CategoriesViewModel(
          gh<_i164.GetCategoriesListUseCase>(),
          gh<_i197.GetAllProductsListUseCase>(),
        ));
    gh.factory<_i183.HomeTabViewModel>(() => _i183.HomeTabViewModel(
          gh<_i164.GetCategoriesListUseCase>(),
          gh<_i170.GetMostSellingProductsListUseCase>(),
          gh<_i1017.GetOccasionsListUseCase>(),
          gh<_i645.Location>(),
          gh<_i1024.GeoCode>(),
        ));
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$LocationModule extends _i765.LocationModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$NetworkModule extends _i851.NetworkModule {}
