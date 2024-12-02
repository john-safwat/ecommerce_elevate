// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../../../../../core/assets/app_colors.dart';

class OccasionsAppBarTitle extends StatelessWidget {
  final String screnTitle;
  final String screenBriefText;

  const OccasionsAppBarTitle({
    super.key,
    required this.screnTitle,
    required this.screenBriefText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(screnTitle),
        Text(
          screenBriefText,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: AppColors.gray),
        ),
      ],
    );
  }
}
