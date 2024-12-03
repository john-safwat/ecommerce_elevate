// 🐦 Flutter imports:
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/providers/app_config_provider.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/profile_response.dart';

// 📦 Package imports:
import 'package:injectable/injectable.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import '../../../../../../core/shared_features/domain/use_case/logged_user_info_use_case.dart';
import 'profile_tab_actions.dart';
import 'profile_tab_state.dart';

@injectable
class ProfileTabViewModel extends BaseViewModel<ProfileTabState, ProfileTabActions> {
final LoggedUserInfoUseCase loggedUserInfoUseCase;


  ProfileTabViewModel(
      this.loggedUserInfoUseCase)
      : super(ProfileInitialState());


  @override
  Future<void> doIntent(ProfileTabActions action) async {
    switch (action) {

      case LoadLoggedUserInfo():{
        _getLoggedUser();
      }
    }
  }


Future<void> _getLoggedUser() async {
  emit(ProfileLoadingState());

  final Results<ProfileResponse?> profile =
  await loggedUserInfoUseCase.call("Bearer ${getIt<AppConfigProvider>().token}");

  switch (profile) {
    case Success<ProfileResponse?>():
      {
        emit(ProfileSuccessState(profile.data!.user!));
      }
    case Failure<ProfileResponse?>():{
      emit(ProfileFailState(
        mapExceptionToMessage(profile.exception),
        profile.exception,
      ));
    }
  }
}}