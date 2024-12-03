import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/shared_widgets/servier_error_widget.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/auth/presentation/edit_profile/edit_profile_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/edit_profile/edit_profile_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/edit_profile/widgets/user_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView, ProfileViewModel> {
  @override
  void initState() {
    super.initState();

    viewModel.doIntent(LoadDataAction());
  }

  @override
  void dispose() {
    viewModel.doIntent(ClearAction());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => viewModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.editProfile),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Badge.count(
                  count: 3,
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    size: 28,
                  ),
                ),
              )
            ],
          ),
          body: BlocConsumer<ProfileViewModel, ProfileViewState>(
            listener: (context, state) {
              if (state is NavigateToChangePasswordState) {
                Navigator.pushNamed(context, Routes.resetPasswordViewRoute);
              }
              if (state is ShowLoadingState) {
                AppDialogs.showLoading(
                    message: viewModel.locale!.loading, context: context);
              }
              if (state is HideLoadingState) {
                Navigator.pop(context);
              }
              if (state is ShowSuccessMessageState) {
                AppDialogs.showSuccessDialog(
                    message: viewModel.locale!.profileUpdateSuccessfully,
                    context: context,
                    posActionTitle: viewModel.locale!.ok);
              }

              if (state is ShowFailMessageState) {
                AppDialogs.showFailDialog(
                    message: state.message,
                    context: context,
                    posActionTitle: viewModel.locale!.tryAgain);
              }
              // if (state is UpdateImageProfileFailureState) {
              //   log(state.message);
              //   AppDialogs.showFailDialog(
              //       message: state.message,
              //       context: context,
              //       posActionTitle: viewModel.locale!.tryAgain);
              // }
            },
            builder: (context, state) {
              if (state is ProfileDataLoadingState) {
                return Center(
                  child: Lottie.asset(AnimationsAssets.checkAnimation),
                );
              } else if (state is ProfileDataLoadingFailState) {
                return ServerErrorWidget(
                  state.message,
                  viewModel.locale!.tryAgain,
                  () {
                    viewModel.doIntent(
                      LoadDataAction(),
                    );
                  },
                );
              } else {
                return UserForm(viewModel);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel initViewModel() {
    return getIt<ProfileViewModel>();
  }
}
