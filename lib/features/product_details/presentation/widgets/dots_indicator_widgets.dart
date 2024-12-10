// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/features/product_details/presentation/widgets/custom_dot_indicator.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    super.key,
    required this.dotNumber,
    required this.currentDot,
  });

  final int dotNumber;
  final int currentDot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotNumber, (index) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 8,
            bottom: 16,
          ),
          child: CustomDotIndicator(isActive: index == currentDot),
        );
      }),
    );
  }
}
