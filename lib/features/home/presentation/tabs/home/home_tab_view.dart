// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/category/category.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/products/product.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_state.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/view_model/home_tab_view_model.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/widgets/best_seller_card_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/widgets/category_icon_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/widgets/home_app_bar.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/widgets/occasions_card_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/home/widgets/title_widget.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends BaseState<HomeTabView, HomeTabViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadDataAction());
    viewModel.doIntent(LoadLocationAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeTabViewModel, HomeTabStates>(
        builder: (context, state) {
          List<Product>? products = [];
          List<Category>? categories = [];
          List<Occasion>? occasions = [];

          if (state.occasionsState
              is HomeTabLoadingSuccessState<List<Occasion>?>) {
            occasions = state.occasionsState.data as List<Occasion>;
          }
          if (state.categoriesState
              is HomeTabLoadingSuccessState<List<Category>?>) {
            categories = state.categoriesState.data as List<Category>;
          }
          if (state.productsState
              is HomeTabLoadingSuccessState<List<Product>?>) {
            products = state.productsState.data as List<Product>;
          }

          return SafeArea(
            child: CustomScrollView(
              slivers: [
                HomeAppBar(
                  searchHint: viewModel.locale!.search,
                  locationMessage: viewModel.locationMessage,
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: categories.isEmpty,
                    child: Column(
                      children: [
                        TitleWidget(
                          title: viewModel.locale!.categories,
                          buttonTitle: viewModel.locale!.viewAll,
                          onTextButtonPress: () {},
                        ),
                        SizedBox(
                          height: 96,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CategoryIconWidget(
                              category: categories!.isEmpty
                                  ? Category(name: "----------")
                                  : categories[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 16),
                            itemCount:
                                categories.isEmpty ? 20 : categories.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: products.isEmpty,
                    child: Column(
                      children: [
                        TitleWidget(
                          title: viewModel.locale!.bestSellers,
                          buttonTitle: viewModel.locale!.viewAll,
                          onTextButtonPress: () {
                            Navigator.of(context).pushNamed(
                              Routes.bestSellerViewRoute,
                              arguments: products,
                            );
                          },
                        ),
                        SizedBox(
                          height: 210,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                // navigator to product details view
                                Navigator.of(context).pushNamed(
                                  Routes.productDetailsRoute,
                                  arguments: products?[index],
                                );
                              },
                              child: BestSellerCardWidget(
                                product: products!.isEmpty
                                    ? Product(title: "----------", price: 100)
                                    : products[index],
                                function: () {},
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 16),
                            itemCount: products.isEmpty ? 20 : products.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Skeletonizer(
                    enabled: occasions.isEmpty,
                    child: Column(
                      children: [
                        TitleWidget(
                          title: viewModel.locale!.occasions,
                          buttonTitle: viewModel.locale!.viewAll,
                          onTextButtonPress: () {},
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                OccasionsCardWidget(
                              occasion: occasions!.isEmpty
                                  ? Occasion(name: "-------")
                                  : occasions[index],
                              function: () {},
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 16),
                            itemCount:
                                occasions.isEmpty ? 20 : occasions.length,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  HomeTabViewModel initViewModel() {
    return getIt<HomeTabViewModel>();
  }
}
