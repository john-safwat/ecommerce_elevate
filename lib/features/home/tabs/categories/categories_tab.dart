// 🐦 Flutter imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_states.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/view_model/categories_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/widgets/categories_app_bar_widget.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/widgets/categories_tabview_widget.dart';
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
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadCategorisDataActions());
  }
  

  @override
  dispose() {
    super.dispose();
    viewModel.tabController.dispose();
    viewModel.tabController.removeListener(() {});
  }

  List<Category> categoriesList = [];
  List<Product> productsList = [];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<CategoriesViewModel, CategoriesStates>(
        listener: (context, state) {
          if (state is CategoriesSuccessState) {
            categoriesList = state.categories;
            //----> all first category products
            viewModel.doIntent(
              LoadProductsDataActions(state.categories[0].id ?? ''),
            );
            //---> listen to tab controller
            _addListenersToTabBar();
          }
          if (state is GetAllProductsSuccessState) {
            productsList = state.products;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                ///--------> Categories App Bar
                CategoriesAppBarWidget(
                  searchHint: viewModel.locale!.search,
                ),
                //----------------> Categories Tabs
                Skeletonizer(
                  enabled: categoriesList.isEmpty,
                  child: DefaultTabController(
                    length: categoriesList.isEmpty ? 6 : categoriesList.length,
                    child: OccasionsTabbarWidget(
                      tabController: categoriesList.isEmpty
                          ? TabController(length: 6, vsync: this)
                          : viewModel.tabController,
                      isIndecatorLoading: categoriesList.isEmpty ? true : false,
                      tabs: categoriesList.isEmpty
                          ? [...List.filled(6, const Tab(text: "**********"))]
                          : categoriesList.map((category) {
                              return Tab(text: category.name ?? "");
                            }).toList(),
                    ),
                  ),
                ),
                //------------> Categories Tab View
                Expanded(
                    child: CategoriesTabsViewWidget(
                  viewModel: viewModel,
                  productsList: productsList,
                )),
              ],
            ),
          );
        },
      ),
    );
  }

  void _addListenersToTabBar() {
    viewModel.tabController = TabController(
      length: categoriesList.length,
      vsync: this,
    )..addListener(() {
        if (viewModel.tabController.indexIsChanging) return;
        productsList.clear();
        viewModel.doIntent(
          LoadProductsDataActions(
              categoriesList[viewModel.tabController.index].id ?? ''),
        );
      });
  }

  @override
  CategoriesViewModel initViewModel() {
    return getIt<CategoriesViewModel>();
  }
}
