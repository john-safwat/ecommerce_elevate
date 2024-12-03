// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final bool enabled;
  final String title;

  const SearchTextField(
      {required this.enabled, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.white[AppColors.colorCode70]!,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.white[AppColors.colorCode70]!,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1, color: AppColors.white[AppColors.colorCode70]!)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1, color: AppColors.white[AppColors.colorCode70]!)),
        hintText: title,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 1, color: AppColors.white[AppColors.colorCode70]!)),
      ),
    );
  }
}
