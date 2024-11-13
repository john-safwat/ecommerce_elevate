// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
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
import '../../features/home/view_model/home_view_model.dart' as _i656;
import '../datasource_execution/datasource_execution.dart' as _i166;
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
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i656.HomeViewModel>(() => _i656.HomeViewModel());
    gh.singleton<_i166.DataSourceExecution>(() => _i166.DataSourceExecution());
    gh.singleton<_i56.AppConfigProvider>(() => _i56.AppConfigProvider());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
        () => networkModule.providerInterceptor());
    gh.singleton<_i187.AuthRetrofitClient>(
        () => _i187.AuthRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i1071.AuthLocalDatasource>(
        () => _i909.AuthLocalDatasourceImpl(gh<_i460.SharedPreferences>()));
    gh.singleton<_i822.LanguageProvider>(
        () => _i822.LanguageProvider(gh<_i460.SharedPreferences>()));
    gh.factory<_i1070.AuthRemoteDatasource>(() => _i81.AuthRemoteDatasourceImpl(
          gh<_i187.AuthRetrofitClient>(),
          gh<_i166.DataSourceExecution>(),
        ));
    gh.lazySingleton<_i348.AppInitializer>(() => _i348.AppInitializer(
          gh<_i822.LanguageProvider>(),
          gh<_i56.AppConfigProvider>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl(
          gh<_i1070.AuthRemoteDatasource>(),
          gh<_i1071.AuthLocalDatasource>(),
        ));
    gh.factory<_i90.ForgetPasswordUseCase>(
        () => _i90.ForgetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i529.SignupUserUseCase>(
        () => _i529.SignupUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i376.DeleteTokenUseCase>(
        () => _i376.DeleteTokenUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i1055.SignupViewModel>(
        () => _i1055.SignupViewModel(gh<_i529.SignupUserUseCase>()));
    gh.factory<_i697.LoginUserUseCase>(
        () => _i697.LoginUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i149.ResetPasswordUseCase>(
        () => _i149.ResetPasswordUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i660.VerifyResetPasswordUseCase>(
        () => _i660.VerifyResetPasswordUseCase(gh<_i961.AuthRepository>()));
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

class _$LoggerModule extends _i774.LoggerModule {}

class _$NetworkModule extends _i184.NetworkModule {}
