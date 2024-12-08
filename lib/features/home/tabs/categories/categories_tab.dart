// 🐦 Flutter imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_states.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/widgets/categories_app_bar_widget.dart';
import 'package:ecommerce_elevate/features/occasions/widgets/occasions_tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends BaseState<CategoriesTab, CategoriesViewModel>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadCategorisDataActions());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<CategoriesViewModel, CategoriesStates>(
        builder: (context, state) {
          List<Category>? categoriesList = [];

          if (state is CategoriesSuccessState) {
            categoriesList = state.categories;
            tabController = TabController(
              length: categoriesList.length,
              vsync: this,
            );
          }

          return SafeArea(
            child: CustomScrollView(
              slivers: [

              ///--------> Categories App Bar
                SliverToBoxAdapter(
                  child: CategoriesAppBarWidget(
                    searchHint: viewModel.locale?.search ?? 'search',
                  ),
                ),

                ///--------> Categories Tabbar Widget
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: categoriesList.isEmpty,
                    child: DefaultTabController(
                      length:
                          categoriesList.isEmpty ? 6 : categoriesList.length,
                      child: OccasionsTabbarWidget(
                        isIndecatorLoading:
                            categoriesList.isEmpty ? true : false,
                        tabController: categoriesList.isEmpty
                            ? TabController(length: 6, vsync: this)
                            : tabController,
                        tabs: categoriesList.isEmpty
                            ? [...List.filled(6, const Tab(text: "**********"))]
                            : categoriesList.map((category) {
                                return Tab(text: category.name ?? "");
                              }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  CategoriesViewModel initViewModel() {
    return getIt<CategoriesViewModel>();
  }
}
