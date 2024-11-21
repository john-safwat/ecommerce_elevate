import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/shared_widgets/search_text_field.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_view_model.dart';
import 'package:flutter/material.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends BaseState<HomeTabView, HomeTabViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadLocationAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    // todo: test navigation to product details view
                    Navigator.pushNamed(context, Routes.productDetailsRoute);
                  },
                  child: Image.asset(
                    AppImages.logo,
                    width: viewModel.mediaQuery!.width * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SearchTextField(
                    enabled: false,
                    title: viewModel.locale!.search,
                  ),
                )
              ],
            ),
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: ValueListenableBuilder(
                valueListenable: viewModel.locationMessage,
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
          ),
        ],
      ),
    );
  }

  @override
  HomeTabViewModel initViewModel() {
    return getIt<HomeTabViewModel>();
  }
}
