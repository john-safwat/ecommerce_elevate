// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/shared_widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final String searchHint;
  final ValueNotifier<String> locationMessage;

  const HomeAppBar(
      {required this.searchHint, required this.locationMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        children: [
          Image.asset(
            AppImages.logo,
            width: MediaQuery.of(context).size.width * 0.25,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SearchTextField(
              enabled: false,
              title: searchHint,
            ),
          )
        ],
      ),
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: ValueListenableBuilder(
          valueListenable: locationMessage,
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.black[AppColors.colorCode40],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
