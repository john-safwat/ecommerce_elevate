// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_state.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/widget/profile_app_bar.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/widget/profile_wiget.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/base/base_view.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/di/di.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends BaseState<ProfileTab, ProfileTabViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadLoggedUserInfo());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: const ProfileAppBar(),
        body: BlocConsumer<ProfileTabViewModel, ProfileTabState>(
          listener: (context, state) {
            if (state.navigationState is NavigateToLoginState) {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            }
            if (state.navigationState is ShowLoadingState) {
              AppDialogs.showLoading(
                  message: viewModel.locale!.loading, context: context);
            }
            if (state.navigationState is HideDialogState) {
              Navigator.pop(context);
            }
            if (state.navigationState is ProfileNavigatorToAboutUs) {
              Navigator.pushNamed(context, Routes.aboutUsRoute);
            }
            if (state.navigationState is QuestionDialogState) {
              AppDialogs.showInfoDialog(
                  message: viewModel.locale!.areYouSureYouWantToLogout,
                  context: context,
                  posActionTitle: viewModel.locale!.yes,
                  negativeActionTitle: viewModel.locale!.no,
                  posAction: () {
                    viewModel.doIntent(LogoutUser());
                  });
            }
          },
          builder: (context, state) {
            if (viewModel.appConfigProvider!.token.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AnimationsAssets.loginImageAnimation),
                  const SizedBox(height: 8),
                  Text(
                    viewModel.locale!.youMustBeLoggedIn,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.doIntent(OnLoginPressAction());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Text(viewModel.locale!.login),
                    ),
                  )
                ],
              );
            }
            if (state.userProfileState is ProfileSuccessState) {
              return const ProfileWidget();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AnimationsAssets.emptyAnimation),
                  const SizedBox(height: 16),
                  Text(viewModel.locale!.loading)
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  ProfileTabViewModel initViewModel() {
    return getIt.get<ProfileTabViewModel>();
  }
}
