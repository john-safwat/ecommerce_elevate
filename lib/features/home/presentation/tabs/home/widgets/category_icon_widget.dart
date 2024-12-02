// 🐦 Flutter imports:

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/shared_features/domain/entities/category/category.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class CategoryIconWidget extends StatelessWidget {
  final Category category;

  const CategoryIconWidget({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.lightPink,
            ),
            child: CachedNetworkImage(
              imageUrl: category.image ?? "",
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColors.pink,
              ),
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Text(
            category.name ?? "No Name",
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
