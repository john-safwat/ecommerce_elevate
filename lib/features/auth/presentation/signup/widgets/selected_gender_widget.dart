import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedGenderWidget extends StatelessWidget {
  const SelectedGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupViewModel, SignupViewState>(
      builder: (context, state) {
        var theme = Theme.of(context);
        SignupViewModel viewModel = BlocProvider.of<SignupViewModel>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              viewModel.locale!.gender,
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Row(
                children: [
                  Radio<Gender>(
                    activeColor: AppColors.pink,
                    value: Gender.female,
                    groupValue: viewModel.selectedGender,
                    onChanged: (Gender? value) {
                      viewModel.doIntent(ChangeGenderAction(gender: value!));
                    },
                  ),
                  Text(viewModel.locale!.female,
                      style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio<Gender>(
                    activeColor: AppColors.pink,
                    value: Gender.male,
                    groupValue: viewModel.selectedGender,
                    onChanged: (Gender? value) {
                      viewModel.doIntent(ChangeGenderAction(gender: value!));
                    },
                  ),
                  Text(viewModel.locale!.male,
                      style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
