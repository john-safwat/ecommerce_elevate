// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/auth/presentation/signup/signup_view_model.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChangeGender,
  });

  final Gender value;
  final Gender groupValue;
  final String title;
  final Function(Gender gender) onChangeGender;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () {
        onChangeGender.call(value);
      },
      child: Row(
        children: [
          Radio<Gender>(
            activeColor: AppColors.pink,
            value: value,
            groupValue: groupValue,
            onChanged: (Gender? value) {
              onChangeGender.call(value!);
            },
          ),
          Text(title, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
