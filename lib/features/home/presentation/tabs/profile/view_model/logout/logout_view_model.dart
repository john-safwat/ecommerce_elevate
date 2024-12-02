// 🐦 Flutter imports:
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/contract/auth_local_datasource.dart';
import 'package:ecommerce_elevate/features/auth/data/datasource/impl/auth_local_datasource_impl.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/logout/logout_response.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/logout_user_use_case.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/logout/logout_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/profile/view_model/logout/logout_states.dart';


// 📦 Package imports:

import 'package:injectable/injectable.dart';


// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';


@injectable
class LogoutViewModel extends BaseViewModel<LogoutStates, LogoutActions> {
  final LogoutUserUseCase logoutUserUseCase;


  LogoutViewModel(this.logoutUserUseCase)
      : super(LogoutInitialState());


  @override
  Future<void> doIntent(LogoutActions action) async {
    switch (action) {
      case LogoutUser():
        {
          _logout();
        }
    }
  }

  Future<void> _logout() async {
    emit(LogoutLoadingState());

    final Results<LogoutResponse?> logout =
    await logoutUserUseCase.call("Bearer ${getIt<AppConfigProvider>().token}");

    switch (logout) {
      case Success<LogoutResponse?>():
        {
          if(logout.data?.message == "success"){
          emit(LogoutSuccessState());
}


        }
      case Failure<LogoutResponse?>():
        {
          emit(LogoutFailState(
              mapExceptionToMessage(logout.exception),
              logout.exception

          ));
        }
    }
  }
}


