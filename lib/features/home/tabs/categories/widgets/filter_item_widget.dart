import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({
    super.key,
    required this.filterText,
    required this.onPressedFilter,
  });

  final String filterText;

  final VoidCallback onPressedFilter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressedFilter.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.filter_list,
              color: AppColors.white,
            ),
            const SizedBox(width: 12),
            Text(
              filterText,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.white,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
