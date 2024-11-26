import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDotIndecator extends StatelessWidget {
  const CustomDotIndecator({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      width: isActive ? 25 : 10,
      height: 10,
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.pink : AppColors.white[AppColors.colorCode70],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
