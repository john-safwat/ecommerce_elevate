// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/logout/logout_response.dart';
import 'package:ecommerce_elevate/domain/entities/profile_info/profile_response.dart';
import 'package:ecommerce_elevate/domain/use_case/logged_user_info_use_case.dart';
import 'package:ecommerce_elevate/domain/use_case/logout_user_use_case.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

import 'profile_tab_actions.dart';
import 'profile_tab_state.dart';

@injectable
class ProfileTabViewModel
    extends BaseViewModel<ProfileTabState, ProfileTabActions> {
  final LoggedUserInfoUseCase loggedUserInfoUseCase;
  final LogoutUserUseCase logoutUserUseCase;

  ProfileTabViewModel(this.loggedUserInfoUseCase, this.logoutUserUseCase)
      : super(ProfileTabState());

  @override
  Future<void> doIntent(ProfileTabActions action) async {
    switch (action) {
      case LoadLoggedUserInfo():
        {
          getLoggedUser();
        }
      case OnLoginPressAction():
        {
          _goToLogin();
        }
      case LogoutUser():
        {
          _logout();
        }
      case LogoutConfirmationAction():
        {
          _logoutConfirmation();
        }
      case NavigateToAboutUsAction():
        {
          _navigatorToAboutUS();
        }
      case NavigatorToTermsAndConditionsAction():
        {
          _navigatorToTermsAndConditions();
        }
    }
  }

  Future<void> getLoggedUser() async {
    emit(state.copyWith(userProfileState: ProfileLoadingState()));

    final Results<ProfileResponse?> profile = await loggedUserInfoUseCase
        .call("Bearer ${getIt<AppConfigProvider>().token}");

    switch (profile) {
      case Success<ProfileResponse?>():
        {
          emit(state.copyWith(
              userProfileState: ProfileSuccessState(profile.data!.user!)));
        }
      case Failure<ProfileResponse?>():
        {
          emit(state.copyWith(
              userProfileState: ProfileFailState(
            mapExceptionToMessage(profile.exception),
            profile.exception,
          )));
        }
    }
  }

  Future<void> _logout() async {
    emit(state.copyWith(navigationState: ShowLoadingState()));

    final Results<LogoutResponse?> response =
        await logoutUserUseCase("Bearer ${appConfigProvider!.token}");
    emit(state.copyWith(navigationState: HideDialogState()));
    switch (response) {
      case Success<LogoutResponse?>():
        {
          if (response.data?.message != null) {
            emit(state.copyWith(navigationState: NavigateToLoginState()));
          }
        }
      case Failure<LogoutResponse?>():
        {
          AppDialogs.showErrorToast(mapExceptionToMessage(response.exception));
        }
    }
  }

  void _goToLogin() {
    emit(state.copyWith(navigationState: NavigateToLoginState()));
  }

  void _logoutConfirmation() {
    emit(state.copyWith(navigationState: QuestionDialogState()));
  }

  void _navigatorToAboutUS() {
    emit(state.copyWith(navigationState: ProfileNavigatorToAboutUs()));
  }

  void _navigatorToTermsAndConditions() {
    emit(state.copyWith(
        navigationState: ProfileNavigatorToTermsAndCondtionsState()));
  }
}
