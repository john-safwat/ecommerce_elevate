// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.logo,
              width: MediaQuery.of(context).size.width * 0.25,
              fit: BoxFit.cover,
            ),
            const Icon(
              Icons.notifications_none_sharp,
              color: AppColors.gray,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(100, 72);
}
