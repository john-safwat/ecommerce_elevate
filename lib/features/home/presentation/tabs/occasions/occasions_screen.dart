import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/occasions_app_bar_title.dart';
import 'widgets/occasions_tabbar_widget.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key});

  @override
  State<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState
    extends BaseState<OccasionsScreen, OccasionsViewModel>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadTabsAction());
    tabController = TabController(
      length: 2,
      vsync: this,
    );

    viewModel.selectedOccasionId.addListener(() {
      viewModel.doIntent(LoadProductsAction());
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: OccasionsAppBarTitle(
            screnTitle: viewModel.locale!.occasions,
            screenBriefText: viewModel.locale!.occasionAppBarMessage,
          ),
        ),
        body: Column(
          children: [
            BlocBuilder<OccasionsViewModel, OccasionsStates>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is OccasionLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OccasionFailureState) {
                  return Text(state.errorMessage);
                } else if (state is OccasionTabsSuccessState) {
                  tabController.addListener(() {
                    if (!tabController.indexIsChanging) {
                      viewModel.selectedOccasionId.value =
                          state.occasions![tabController.index].id;
                    }
                  });
                  return Column(
                    children: [
                      OccasionsTabbarWidget(
                        tabController: tabController,
                        tabs: state.occasions!.map((occasion) {
                          return Tab(text: occasion.name ?? "");
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  BlocBuilder<OccasionsViewModel, OccasionsStates>(
                    bloc: viewModel,
                    builder: (context, state) {
                      if (state is ProductsLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProductsFailureState) {
                        return Center(child: Text(state.errorMessage));
                      } else if (state is OccasionProductsSuccessState) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: state.products?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ProductCardWidget(
                              product: state.products![index],
                              buttonTitle: viewModel.locale!.addToCart,
                              buttonIcon: Icons.shopping_cart_outlined,
                              onPressed: () {},
                            );
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  OccasionsViewModel initViewModel() {
    return getIt.get<OccasionsViewModel>();
  }
}
