import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDotIndicator extends StatefulWidget {
  const CustomDotIndicator({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  State<CustomDotIndicator> createState() => _CustomDotIndicatorState();
}

class _CustomDotIndicatorState extends State<CustomDotIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: widget.isActive ? 45 : 10,
      height: 10,
      decoration: BoxDecoration(
        color:
            widget.isActive ? AppColors.pink : AppColors.white[AppColors.colorCode70],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}