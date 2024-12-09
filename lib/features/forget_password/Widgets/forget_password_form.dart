// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/theme/app_theme.dart';
import 'package:ecommerce_elevate/features/forget_password/forget_password_view_model.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../forget_password_contract.dart';

// ignore: must_be_immutable
class ForgetPasswordForm extends StatelessWidget {
  late ForgetPasswordViewModel viewModel;

  ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<ForgetPasswordViewModel>(context);
    return Form(
        onChanged: () => viewModel.doIntent(FormDataChangedAction()),
        key: viewModel.formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewModel.locale!.forgetPassword,
                    style: AppTheme.appTheme.textTheme.titleLarge!
                        .copyWith(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    viewModel
                        .locale!.pleaseEnterYourEmailAssociatedToYourAccount,
                    style: AppTheme.appTheme.textTheme.titleLarge!
                        .copyWith(fontSize: 14)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
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
            const SizedBox(height: 32),
            ValueListenableBuilder(
              valueListenable: viewModel.valid,
              builder: (context, value, child) => ElevatedButton(
                  onPressed: () => viewModel.doIntent(ForgetPasswordAction()),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: value
                          ? AppColors.pink
                          : AppColors.black[AppColors.colorCode30]),
                  child: Text(viewModel.locale!.sendOtp)),
            ),
          ],
        ));
  }
}
