import 'package:ecommerce_elevate/features/home/product_details/presentation/widgets/custom_dot_indecator.dart';
import 'package:flutter/material.dart';

class DontsIndecatorWidget extends StatelessWidget {
  const DontsIndecatorWidget({
    super.key,
    required this.dotNumber,
    required this.currentDot,
  });
  final int dotNumber;
  final int currentDot;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotNumber, (index) {
        return Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.02,
            bottom: size.height * 0.01,
          ),
          child: CustomDotIndecator(isActive: index == currentDot),
        );
      }),
    );
  }
}
