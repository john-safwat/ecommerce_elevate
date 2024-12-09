// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/signup/signup_contract.dart';
import 'package:ecommerce_elevate/features/signup/signup_view_model.dart';
import 'package:ecommerce_elevate/features/signup/widgets/signup_form.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends BaseState<SignupView, SignupViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<SignupViewModel, SignupViewState>(
        listener: (context, state) {
          if (state is SignupLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is SignupSuccessState) {
            AppDialogs.showSuccessDialog(
                message: viewModel.locale!.accountCreatedSuccessfully,
                context: context,
                posActionTitle: viewModel.locale!.ok,
                posAction: () {
                  viewModel.doIntent(SignupConfirmAction());
                });
          }
          if (state is SignupFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is EmailAlreadyExistState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.emailAlreadyExist,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is BadRequestState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.dioDefaultMessage,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is UserNameAlreadyExistState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.userNameAlreadyExist,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToLoginScreenState) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.signup),
          ),
          body: SignupForm(viewModel),
        ),
      ),
    );
  }

  @override
  SignupViewModel initViewModel() {
    return getIt<SignupViewModel>();
  }
}
