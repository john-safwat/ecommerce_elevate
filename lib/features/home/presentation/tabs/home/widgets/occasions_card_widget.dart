import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:flutter/material.dart';

class OccasionsCardWidget extends StatelessWidget {
  final Occasion occasion;
  final Function function;

  const OccasionsCardWidget(
      {required this.occasion, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl: occasion.image ?? "",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(AppImages.imagePlaceholder),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            occasion.name ?? "",
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
