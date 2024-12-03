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
import '../../features/auth/domain/use_case/change_password_use_case.dart'
    as _i863;
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
import '../../features/auth/presentation/change_password/change_password_view_model.dart'
    as _i98;
import '../../features/auth/presentation/forget_password/forget_password_view_model.dart'
    as _i599;
import '../../features/auth/presentation/login/login_view_model.dart' as _i225;
import '../../features/auth/presentation/otp_verify/otp_verify_view_model.dart'
    as _i1033;
import '../../features/auth/presentation/reset_password/reset_password_view_model.dart'
    as _i974;
import '../../features/auth/presentation/signup/signup_view_model.dart'
    as _i1055;
import '../../features/best_seller/presentation/view_model/best_seller_view_model.dart'
    as _i835;
import '../../features/home/best_seller/presentation/view_model/best_seller_view_model.dart'
    as _i232;
import '../../features/home/data/api/get_user_logged_info/get_user_logged_info_retrofit_client.dart'
    as _i2;
import '../../features/home/data/api/logout/logout_retrofit_client.dart'
    as _i489;
import '../../features/home/presentation/tabs/cart/view_model/cart_tab_view_model.dart'
    as _i859;
import '../../features/home/presentation/tabs/home/view_model/home_tab_view_model.dart'
    as _i742;
import '../../features/home/presentation/tabs/profile/view_model/logout/logout_view_model.dart'
    as _i642;
import '../../features/home/presentation/tabs/profile/view_model/profile_tab_view_model.dart'
    as _i793;
import '../../features/home/presentation/view_model/home_view_model.dart'
    as _i77;
import '../../features/occasions/occasions_view_model/occasions_view_model.dart'
    as _i535;
import '../../features/product_details/presentation/product_details_view_model.dart'
    as _i155;
import '../datasource_execution/datasource_execution.dart' as _i166;
import '../providers/app_config_provider.dart' as _i56;
import '../providers/language_provider.dart' as _i822;
import '../shared_features/data/api/cart/cart_retrofit_client.dart' as _i703;
import '../shared_features/data/api/categories/categories_retrofit_client.dart'
    as _i162;
import '../shared_features/data/api/occasions/occasions_retrofit_client.dart'
    as _i234;
import '../shared_features/data/api/products/products_retrofit_client.dart'
    as _i174;
import '../shared_features/data/datasource/contract/cart_remote_datasource.dart'
    as _i690;
import '../shared_features/data/datasource/contract/categories_remote_datasource.dart'
    as _i1026;
import '../shared_features/data/datasource/contract/logged_user_info_remote_datasource.dart'
    as _i376;
import '../shared_features/data/datasource/contract/logout_remote_datasource.dart'
    as _i723;
import '../shared_features/data/datasource/contract/occasions_remote_datasource.dart'
    as _i897;
import '../shared_features/data/datasource/contract/products_remote_datasource.dart'
    as _i246;
import '../shared_features/data/datasource/impl/cart_remote_datasource_impl.dart'
    as _i287;
import '../shared_features/data/datasource/impl/categories_remote_datasource_impl.dart'
    as _i455;
import '../shared_features/data/datasource/impl/logged_user_info_remote_datasource_impl.dart'
    as _i343;
import '../shared_features/data/datasource/impl/logout_remote_datasource_impl.dart'
    as _i757;
import '../shared_features/data/datasource/impl/occasions_remote_datasource_impl.dart'
    as _i982;
import '../shared_features/data/datasource/impl/products_remote_datasource_impl.dart'
    as _i655;
import '../shared_features/data/repository/cart_repository_impl.dart' as _i1072;
import '../shared_features/data/repository/categories_repository_impl.dart'
    as _i421;
import '../shared_features/data/repository/logged_user_info_repository_impl.dart'
    as _i767;
import '../shared_features/data/repository/logout_repository_impl.dart'
    as _i908;
import '../shared_features/data/repository/occasions_repository_impl.dart'
    as _i919;
import '../shared_features/data/repository/products_repository_impl.dart'
    as _i100;
import '../shared_features/domain/repository/cart_repository.dart' as _i149;
import '../shared_features/domain/repository/categories_repository.dart'
    as _i784;
import '../shared_features/domain/repository/logged_user_info_repository.dart'
    as _i989;
import '../shared_features/domain/repository/logout_repository.dart' as _i826;
import '../shared_features/domain/repository/occasions_repository.dart'
    as _i486;
import '../shared_features/domain/repository/products_repository.dart' as _i468;
import '../shared_features/domain/use_case/add_item_to_cart_use_case.dart'
    as _i23;
import '../shared_features/domain/use_case/delete_product_from_cart_use_case.dart'
    as _i689;
import '../shared_features/domain/use_case/get_all_products_list_use_case.dart'
    as _i886;
import '../shared_features/domain/use_case/get_categories_list_use_case.dart'
    as _i120;
import '../shared_features/domain/use_case/get_most_selling_products_list_use_case.dart'
    as _i1056;
import '../shared_features/domain/use_case/get_occasions_list_use_case.dart'
    as _i674;
import '../shared_features/domain/use_case/get_user_cart_use_case.dart'
    as _i357;
import '../shared_features/domain/use_case/logged_user_info_use_case.dart'
    as _i448;
import '../shared_features/domain/use_case/logout_user_use_case.dart' as _i870;
import '../shared_features/domain/use_case/update_cart_product_use_case.dart'
    as _i618;
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
    gh.factory<_i232.BestSellerViewModel>(() => _i232.BestSellerViewModel());
    gh.factory<_i77.HomeViewModel>(() => _i77.HomeViewModel());
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
    gh.singleton<_i703.CartRetrofitClient>(
        () => _i703.CartRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i162.CategoriesRetrofitClient>(
        () => _i162.CategoriesRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i234.OccasionsRetrofitClient>(
        () => _i234.OccasionsRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i174.ProductsRetrofitClient>(
        () => _i174.ProductsRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i187.AuthRetrofitClient>(
        () => _i187.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i2.GetUserLoggedInfoRetrofitClient>(
        () => _i2.GetUserLoggedInfoRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i489.LogoutRetrofitClient>(
        () => _i489.LogoutRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i246.ProductsDatasource>(
        () => _i655.ProductsRemoteDatasourceImpl(
              gh<_i174.ProductsRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i1026.CategoriesRemoteDatasource>(
        () => _i455.CategoriesRemoteDatasourceImpl(
              gh<_i162.CategoriesRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i376.LoggedUserInfoRemoteDatasource>(
        () => _i343.LoggedUserInfoRemoteDatasourceImpl(
              gh<_i2.GetUserLoggedInfoRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i1071.AuthLocalDatasource>(
        () => _i909.AuthLocalDatasourceImpl(gh<_i460.SharedPreferences>()));
    gh.singleton<_i822.LanguageProvider>(
        () => _i822.LanguageProvider(gh<_i460.SharedPreferences>()));
    gh.factory<_i784.CategoriesRepository>(() => _i421.CategoriesRepositoryImpl(
        gh<_i1026.CategoriesRemoteDatasource>()));
    gh.factory<_i120.GetCategoriesListUseCase>(
        () => _i120.GetCategoriesListUseCase(gh<_i784.CategoriesRepository>()));
    gh.factory<_i989.LoggedUserInfoRepository>(() =>
        _i767.LoggedUserInfoRepositoryImpl(
            gh<_i376.LoggedUserInfoRemoteDatasource>()));
    gh.factory<_i690.CartRemoteDatasource>(() => _i287.CartRemoteDatasourceImpl(
          gh<_i166.DataSourceExecution>(),
          gh<_i703.CartRetrofitClient>(),
        ));
    gh.factory<_i468.ProductsRepository>(
        () => _i100.ProductsRepositoryImpl(gh<_i246.ProductsDatasource>()));
    gh.factory<_i723.LogoutRemoteDatasource>(
        () => _i757.LogoutRemoteDatasourceImpl(
              gh<_i489.LogoutRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.factory<_i1070.AuthRemoteDatasource>(() => _i81.AuthRemoteDatasourceImpl(
          gh<_i187.AuthRetrofitClient>(),
          gh<_i166.DataSourceExecution>(),
        ));
    gh.factory<_i897.OccasionsRemoteDatasource>(
        () => _i982.OccasionsRemoteDatasourceImpl(
              gh<_i234.OccasionsRetrofitClient>(),
              gh<_i166.DataSourceExecution>(),
            ));
    gh.lazySingleton<_i348.AppInitializer>(() => _i348.AppInitializer(
          gh<_i822.LanguageProvider>(),
          gh<_i56.AppConfigProvider>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i826.LogoutRepository>(
        () => _i908.LogoutRepositoryImpl(gh<_i723.LogoutRemoteDatasource>()));
    gh.factory<_i1056.GetMostSellingProductsListUseCase>(() =>
        _i1056.GetMostSellingProductsListUseCase(
            gh<_i468.ProductsRepository>()));
    gh.factory<_i486.OccasionsRepository>(() =>
        _i919.OccasionsRepositoryImpl(gh<_i897.OccasionsRemoteDatasource>()));
    gh.factory<_i886.GetAllProductsListUseCase>(
        () => _i886.GetAllProductsListUseCase(gh<_i468.ProductsRepository>()));
    gh.factory<_i149.CartRepository>(
        () => _i1072.CartRepositoryImpl(gh<_i690.CartRemoteDatasource>()));
    gh.factory<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl(
          gh<_i1070.AuthRemoteDatasource>(),
          gh<_i1071.AuthLocalDatasource>(),
        ));
    gh.factory<_i448.LoggedUserInfoUseCase>(() =>
        _i448.LoggedUserInfoUseCase(gh<_i989.LoggedUserInfoRepository>()));
    gh.factory<_i793.ProfileTabViewModel>(
        () => _i793.ProfileTabViewModel(gh<_i448.LoggedUserInfoUseCase>()));
    gh.singleton<_i23.AddItemToCartUseCase>(
        () => _i23.AddItemToCartUseCase(gh<_i690.CartRemoteDatasource>()));
    gh.factory<_i535.OccasionsViewModel>(
        () => _i535.OccasionsViewModel(gh<_i886.GetAllProductsListUseCase>()));
    gh.factory<_i870.LogoutUserUseCase>(
        () => _i870.LogoutUserUseCase(gh<_i826.LogoutRepository>()));
    gh.factory<_i90.ForgetPasswordUseCase>(
        () => _i90.ForgetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i529.SignupUserUseCase>(
        () => _i529.SignupUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i689.DeleteProductFromCartUseCase>(
        () => _i689.DeleteProductFromCartUseCase(gh<_i149.CartRepository>()));
    gh.factory<_i357.GetUserCartUseCase>(
        () => _i357.GetUserCartUseCase(gh<_i149.CartRepository>()));
    gh.factory<_i618.UpdateCartProductUseCase>(
        () => _i618.UpdateCartProductUseCase(gh<_i149.CartRepository>()));
    gh.factory<_i376.DeleteTokenUseCase>(
        () => _i376.DeleteTokenUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i674.GetOccasionsListUseCase>(
        () => _i674.GetOccasionsListUseCase(gh<_i486.OccasionsRepository>()));
    gh.factory<_i1055.SignupViewModel>(
        () => _i1055.SignupViewModel(gh<_i529.SignupUserUseCase>()));
    gh.factory<_i863.ChangePasswordUseCase>(
        () => _i863.ChangePasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i697.LoginUserUseCase>(
        () => _i697.LoginUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i149.ResetPasswordUseCase>(
        () => _i149.ResetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i660.VerifyResetPasswordUseCase>(
        () => _i660.VerifyResetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i642.LogoutViewModel>(
        () => _i642.LogoutViewModel(gh<_i870.LogoutUserUseCase>()));
    gh.factory<_i974.ResetPasswordViewModel>(
        () => _i974.ResetPasswordViewModel(gh<_i149.ResetPasswordUseCase>()));
    gh.factory<_i859.CartTabViewModel>(() => _i859.CartTabViewModel(
          gh<_i357.GetUserCartUseCase>(),
          gh<_i618.UpdateCartProductUseCase>(),
          gh<_i689.DeleteProductFromCartUseCase>(),
          gh<_i645.Location>(),
          gh<_i1024.GeoCode>(),
        ));
    gh.factory<_i599.ForgetPasswordViewModel>(
        () => _i599.ForgetPasswordViewModel(gh<_i90.ForgetPasswordUseCase>()));
    gh.factory<_i742.HomeTabViewModel>(() => _i742.HomeTabViewModel(
          gh<_i120.GetCategoriesListUseCase>(),
          gh<_i1056.GetMostSellingProductsListUseCase>(),
          gh<_i674.GetOccasionsListUseCase>(),
          gh<_i645.Location>(),
          gh<_i1024.GeoCode>(),
        ));
    gh.factory<_i98.ChangePasswordViewModel>(
        () => _i98.ChangePasswordViewModel(gh<_i863.ChangePasswordUseCase>()));
    gh.factory<_i225.LoginViewModel>(
        () => _i225.LoginViewModel(gh<_i697.LoginUserUseCase>()));
    gh.factory<_i1033.OtpVerifyViewModel>(() => _i1033.OtpVerifyViewModel(
          gh<_i660.VerifyResetPasswordUseCase>(),
          gh<_i90.ForgetPasswordUseCase>(),
        ));
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$LocationModule extends _i765.LocationModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$NetworkModule extends _i851.NetworkModule {}
