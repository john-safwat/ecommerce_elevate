// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/widgets/selected_gender_widget.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../signup_contract.dart';

// ignore: must_be_immutable
class SignupForm extends StatelessWidget {
  SignupViewModel viewModel;

  SignupForm(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    viewModel = BlocProvider.of<SignupViewModel>(context);
    return Form(
      onChanged: () => viewModel.doIntent(FormDataChangedAction()),
      key: viewModel.formKey,
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.nameValidation(value ?? ""),
                  keyboardType: TextInputType.name,
                  controller: viewModel.firstNameController,
                  decoration: InputDecoration(
                    label: Text(viewModel.locale!.firstName),
                    hintText: viewModel.locale!.enterFirstName,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => viewModel.nameValidation(value ?? ""),
                  keyboardType: TextInputType.name,
                  controller: viewModel.lastNameController,
                  decoration: InputDecoration(
                    label: Text(viewModel.locale!.lastName),
                    hintText: viewModel.locale!.enterLastName,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            textInputAction: TextInputAction.next,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: viewModel.passwordVisible,
                  builder: (context, value, child) => TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.passwordValidation(value ?? ""),
                    keyboardType: TextInputType.visiblePassword,
                    controller: viewModel.passwordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () => viewModel
                            .doIntent(ChangePasswordVisibilityAction()),
                        child: Icon(
                            value ? Icons.visibility_off : Icons.visibility),
                      ),
                      label: Text(viewModel.locale!.password),
                      hintText: viewModel.locale!.enterPassword,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: viewModel.passwordConfirmationVisible,
                  builder: (context, value, child) => TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.passwordConfirmationValidation(value ?? ""),
                    keyboardType: TextInputType.visiblePassword,
                    controller: viewModel.confirmPasswordController,
                    obscureText: value,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () => viewModel.doIntent(
                            ChangePasswordConfirmationVisibilityAction()),
                        child: Icon(
                            value ? Icons.visibility_off : Icons.visibility),
                      ),
                      label: Text(viewModel.locale!.rePassword),
                      hintText: viewModel.locale!.rePassword,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          TextFormField(
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => viewModel.phoneValidation(value ?? ""),
            keyboardType: TextInputType.phone,
            controller: viewModel.phoneController,
            decoration: InputDecoration(
              label: Text(viewModel.locale!.phone),
              hintText: viewModel.locale!.enterPhone,
            ),
          ),
          const SizedBox(height: 24),
          const SelectedGenderWidget(),

          ///---> terms and conditions*****
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  viewModel.locale!.create_an_account,
                  style: theme.textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    viewModel.locale!.terms_and_conditions,
                    style: theme.textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          ValueListenableBuilder(
            valueListenable: viewModel.valid,
            builder: (context, value, child) => ElevatedButton(
                onPressed: () => viewModel.doIntent(SignupAction()),
                style: ElevatedButton.styleFrom(
                    backgroundColor: value
                        ? AppColors.pink
                        : AppColors.black[AppColors.colorCode30]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(viewModel.locale!.signup),
                )),
          ),
          const SizedBox(height: 8),

          ///---> already have account*****
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(viewModel.locale!.alreadyHaveAccount),
              TextButton(
                  onPressed: () =>
                      viewModel.doIntent(NavigateToLoginScreenAction()),
                  child: Text(viewModel.locale!.login))
            ],
          ),
        ],
      ),
    );
  }
}
