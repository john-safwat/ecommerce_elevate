// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/reset_password/reset_password_contract.dart';
import 'package:ecommerce_elevate/features/reset_password/reset_password_view_model.dart';
import 'package:ecommerce_elevate/features/reset_password/widget/reset_password_form.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState
    extends BaseState<ResetPasswordView, ResetPasswordViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ResetPasswordViewModel, ResetPasswordViewState>(
        listener: (context, state) {
          if (state is ResetPasswordViewLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToLoginScreenState) {
            Navigator.pop(context);
          }
          if (state is ResetPasswordFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is ResetPasswordSuccessState) {
            AppDialogs.showSuccessDialog(
              message: viewModel.locale!.passwordChangedSuccessfully,
              context: context,
              posActionTitle: viewModel.locale!.ok,
              posAction: () {
                viewModel.doIntent(NavigateToLoginScreenAction());
              },
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.forgetPassword),
          ),
          body: ResetPasswordForm(),
        ),
      ),
    );
  }

  @override
  ResetPasswordViewModel initViewModel() {
    return getIt<ResetPasswordViewModel>();
  }
}
