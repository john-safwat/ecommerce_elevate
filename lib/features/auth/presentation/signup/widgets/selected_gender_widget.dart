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
        SignupViewModel viewModel = BlocProvider.of<SignupViewModel>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(viewModel.locale!.gender),
            Row(
              children: [
                Radio<Gender>(
                  activeColor: AppColors.pink,
                  value: Gender.female,
                  groupValue: viewModel.selectedGender,
                  onChanged: (Gender? value) {
                    viewModel.doIntent(ChangeGenderAction(gender: value!));
                  },
                ),
                Text(viewModel.locale!.female),
              ],
            ),
            const SizedBox(width: 20),
            Row(
              children: [
                Radio<Gender>(
                  activeColor: AppColors.pink,
                  value: Gender.male,
                  groupValue: viewModel.selectedGender,
                  onChanged: (Gender? value) {
                    viewModel.doIntent(ChangeGenderAction(gender: value!));
                  },
                ),
                Text(viewModel.locale!.male),
              ],
            ),
          ],
        );
      },
    );
  }
}
