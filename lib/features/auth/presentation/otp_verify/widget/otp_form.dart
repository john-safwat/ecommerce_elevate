// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/auth/presentation/otp_verify/otp_verify_view_model.dart';
import 'package:ecommerce_elevate/features/auth/presentation/otp_verify/widget/otp_form_field.dart';
import '../otp_verify_contract.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<OtpVerifyViewModel>(context);
    return ListView(
      padding: const EdgeInsets.all(14),
      children: [
        Text(
          viewModel.locale!.emailVerification,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Text(
          viewModel.locale!.pleaseEnterYourCodeThatSendToYourEmailAddress,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
          maxLines: 2,
        ),
        const SizedBox(height: 32),
        Form(
          onChanged: () => viewModel.doIntent(FormDataChangedAction()),
          key: viewModel.formKey,
          child: const Row(
            children: [
              OtpFormField(0),
              SizedBox(width: 8),
              OtpFormField(1),
              SizedBox(width: 8),
              OtpFormField(2),
              SizedBox(width: 8),
              OtpFormField(3),
              SizedBox(width: 8),
              OtpFormField(4),
              SizedBox(width: 8),
              OtpFormField(5),
            ],
          ),
        ),
        const SizedBox(height: 32),
        ValueListenableBuilder(
          valueListenable: viewModel.timerMessage,
          builder: (context, value, child) => Text(
            viewModel.timerMessage.value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 32),
        ValueListenableBuilder(
          valueListenable: viewModel.valid,
          builder: (context, value, child) => ElevatedButton(
            onPressed: () => viewModel.doIntent(OnCompleteCodeVerifyAction()),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: viewModel.valid.value
                  ? AppColors.pink
                  : AppColors.black[AppColors.colorCode30],
            ),
            child: Text(viewModel.locale!.confirm),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.locale!.didNotReceiveCode,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ValueListenableBuilder(
              valueListenable: viewModel.resendMessage,
              builder: (context, value, child) => viewModel.resendTimer == 0
                  ? TextButton(
                      onPressed: () {
                        viewModel.doIntent(OtpResendAction());
                      },
                      child: Text(
                        viewModel.locale!.resend,
                      ),
                    )
                  : Text(
                      viewModel.resendMessage.value,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
