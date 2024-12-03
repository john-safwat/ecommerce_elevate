// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/auth/presentation/login/login_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/login/login_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/login/widget/login_form.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView, LoginViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<LoginViewModel, LoginViewState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            AppDialogs.showLoading(
                message: viewModel.locale!.loading, context: context);
          }
          if (state is LoginSuccessState) {
            AppDialogs.showSuccessDialog(
                message: viewModel.locale!.loggedInSuccessfully,
                context: context,
                posActionTitle: viewModel.locale!.ok,
                posAction: () {
                  viewModel.doIntent(NavigateToHomeScreeAction());
                });
          }
          if (state is NavigateToSignUpScreeState) {
            Navigator.pushNamed(context, Routes.signupRoute);
          }
          if (state is LoginFailState) {
            AppDialogs.showFailDialog(
              message: state.message,
              context: context,
              posActionTitle: viewModel.locale!.ok,
            );
          }
          if (state is InvalidCredentialsState) {
            AppDialogs.showFailDialog(
              message: viewModel.locale!.invalidCredentials,
              context: context,
              posActionTitle: viewModel.locale!.tryAgain,
            );
          }
          if (state is HideLoadingState) {
            Navigator.pop(context);
          }
          if (state is NavigateToHomeScreeState) {
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          }
          if (state is NavigateToForgetPasswordScreenState) {
            Navigator.pushNamed(context, Routes.forgetPasswordRoute);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(viewModel.locale!.login),
          ),
          body: LoginForm(),
        ),
      ),
    );
  }

  @override
  LoginViewModel initViewModel() {
    return getIt<LoginViewModel>();
  }
}
