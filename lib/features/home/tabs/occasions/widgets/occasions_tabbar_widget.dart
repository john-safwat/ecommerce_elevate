import 'package:flutter/material.dart';

import '../../../../../core/assets/app_colors.dart';

class OccasionsTabbarWidget extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const OccasionsTabbarWidget({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      unselectedLabelColor: AppColors.white[AppColors.colorCode70],
      labelColor: AppColors.pink,
      overlayColor: const WidgetStatePropertyAll<Color>(
        Colors.transparent,
      ),
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      indicatorColor: AppColors.pink,
      isScrollable: true,
      tabs: tabs,
    );
  }
}
