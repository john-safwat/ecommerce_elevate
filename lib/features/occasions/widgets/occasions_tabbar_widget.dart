// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../../../../../core/assets/app_colors.dart';

class OccasionsTabbarWidget extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;
  final bool isIndecatorLoading;

  const OccasionsTabbarWidget({
    super.key,
    required this.tabController,
    required this.tabs,
    this.isIndecatorLoading = false,
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
      indicatorColor: isIndecatorLoading ? AppColors.lightGray : AppColors.pink,
      isScrollable: true,
      tabs: tabs,
    );
  }
}
