// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_contract.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/widgets/radio_widget.dart';

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
            Text(
              viewModel.locale!.gender,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 18),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: RadioWidget(
                value: Gender.female,
                groupValue: viewModel.selectedGender,
                onChangeGender: (gender) {
                  viewModel.doIntent(ChangeGenderAction(gender: gender));
                },
                title: viewModel.locale!.female,
              ),
            ),
            Expanded(
              child: RadioWidget(
                value: Gender.male,
                groupValue: viewModel.selectedGender,
                onChangeGender: (value) {
                  viewModel.doIntent(ChangeGenderAction(gender: value));
                },
                title: viewModel.locale!.male,
              ),
            ),
          ],
        );
      },
    );
  }
}
