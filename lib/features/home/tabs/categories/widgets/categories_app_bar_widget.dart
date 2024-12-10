import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/shared_widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class CategoriesAppBarWidget extends StatelessWidget {
  const CategoriesAppBarWidget({super.key, required this.searchHint});
  final String searchHint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: SearchTextField(
              enabled: false,
              title: searchHint,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.white[AppColors.colorCode70]!,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 20,
            ),
            child: const Icon(
              Icons.filter_list,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
