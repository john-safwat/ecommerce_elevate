import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class ImageProfileAndEditIcon extends StatelessWidget {
  const ImageProfileAndEditIcon({
    super.key,
    required this.imageUrl,
    required this.deitIconOnTap,
  });
  final String imageUrl;
  final VoidCallback deitIconOnTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          maxRadius: 41,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
        InkWell(
          onTap: deitIconOnTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: AppColors.pink[AppColors.colorCode40],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
