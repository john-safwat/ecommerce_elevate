// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/forget_password/Widgets/forget_password_form.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_contract.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_view_model.dart';
import 'package:injectable/injectable.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState
    extends BaseState<ForgetPasswordView, ForgetPasswordViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ForgetPasswordViewModel, ForgetPasswordViewState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is ForgetPasswordSuccessState) {
            AppDialogs.showSuccessDialog(
              message: viewModel.locale!.otpSentToYourEmail,
              context: context,
              posActionTitle: viewModel.locale!.ok,
              posAction: () {
                viewModel.doIntent(NavigateToOtpScreenAction());
              },
            );
          }
          if (state is ForgetPasswordFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is InvalidEmailState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.invalidCredentials,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToOtpScreenState) {
            Navigator.pushReplacementNamed(context, Routes.otpVerifyRoute);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.forgetPassword),
          ),
          body: ForgetPasswordForm(),
        ),
      ),
    );
  }

  @override
  ForgetPasswordViewModel initViewModel() {
    return getIt<ForgetPasswordViewModel>();
  }
}
