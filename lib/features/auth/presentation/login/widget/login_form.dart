
// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/login/login_view_model.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../login/login_contract.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  late LoginViewModel viewModel;

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<LoginViewModel>(context);
    return Form(
      onChanged: () => viewModel.doIntent(FormDataChangedAction()),
      key: viewModel.formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => viewModel.emailValidation(value ?? ""),
            keyboardType: TextInputType.emailAddress,
            controller: viewModel.emailController,
            decoration: InputDecoration(
              label: Text(viewModel.locale!.email),
              hintText: viewModel.locale!.enterEmail,
            ),
          ),
          const SizedBox(height: 24),
          ValueListenableBuilder(
            valueListenable: viewModel.passwordVisible,
            builder: (context, value, child) => TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => viewModel.passwordValidation(value ?? ""),
              keyboardType: TextInputType.visiblePassword,
              controller: viewModel.passwordController,
              obscureText: value,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () =>
                      viewModel.doIntent(ChangePasswordVisibilityAction()),
                  child: Icon(value ? Icons.visibility_off : Icons.visibility),
                ),
                label: Text(viewModel.locale!.password),
                hintText: viewModel.locale!.enterPassword,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: viewModel.isRememberMeChecked,
                builder: (context, value, child) => Checkbox(
                  value: value,
                  onChanged: (value) {
                    viewModel.doIntent(RememberMeButtonAction());
                  },
                  activeColor: AppColors.pink,
                ),
              ),
              Text(viewModel.locale!.rememberMe),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    viewModel.doIntent(NavigateToForgetPasswordScreenAction());
                  },
                  child: Text(viewModel.locale!.forgetPassword)),
            ],
          ),
          const SizedBox(height: 32),
          ValueListenableBuilder(
            valueListenable: viewModel.valid,
            builder: (context, value, child) => ElevatedButton(
                onPressed: () => viewModel.doIntent(LoginAction()),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: value
                        ? AppColors.pink
                        : AppColors.black[AppColors.colorCode30]),
                child: Text(viewModel.locale!.login)),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              viewModel.doIntent(GuestLoginAction());
            },
            child: Text(viewModel.locale!.guestLogin),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.locale!.doNotHaveAccount),
              TextButton(
                  onPressed: () =>
                      viewModel.doIntent(NavigateToSignUpScreeAction()),
                  child: Text(viewModel.locale!.signup))
            ],
          )
        ],
      ),
    );
  }
}