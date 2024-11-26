import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/view_model/categories_action.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/view_model/categories_states.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/view_model/categories_view_model.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/widgets/categories_tab_view_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/widgets/categoris_app_bar_title.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/widgets/categoris_tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends BaseState<CategoriesTab, CategoriesViewModel>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  initState() {
    super.initState();
    viewModel.doIntent(LoadCategorisAction());
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    tabController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: CategorisAppBarTitle(
            screnTitle: viewModel.locale!.occasions,
            screenBriefText: viewModel.locale!.occasions,
          ),
        ),
        body: BlocBuilder<CategoriesViewModel, CategoriesStates>(
          builder: (context, state) {
            List<Category>? categories = [];
            if (state is CategoriesSuccessState) {
              categories = state.categories;
              tabController = TabController(
                length: categories.length,
                vsync: this,
              );
              viewModel.doIntent(
                LoadProductsAction(categoryId: categories[0].id ?? ''),
              );
            }
            if (state is CategoriesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            return DefaultTabController(
              length: categories.length,
              child: Column(
                children: [
                  CategorisTabBarWidget(
                    tabController: tabController,
                    tabs: categories.map((category) {
                      return Tab(text: category.name ?? "");
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TabBarView(
                        controller: tabController,
                        children: categories
                            .map(
                              (category) =>
                                  CategoriesTabviewWidget(viewModel: viewModel),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  CategoriesViewModel initViewModel() {
    return getIt.get<CategoriesViewModel>();
  }
}
