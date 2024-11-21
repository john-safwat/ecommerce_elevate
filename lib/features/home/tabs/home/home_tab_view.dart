import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/shared_widgets/search_text_field.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_state.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/view_model/home_tab_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/widgets/categories_widget.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/widgets/occasions_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: viewModel.mediaQuery!.width * 0.25,
                    fit: BoxFit.cover,
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
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BlocBuilder<HomeTabViewModel, HomeTabState>(

                    builder: (context, state) {
                      if (state is DataLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is DataLoadingFailState) {
                        return Center(
                          child: Text(state.message ?? 'yassda'),
                        );
                      }


                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              print(viewModel.occasionsList);
                              return OccasionsWidget(
                                  entity: viewModel.occasionsList, index: index);
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.occasionsList.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(
                              width: 16,
                            ),
                          ),
                        );




                    },

                  ),
                  BlocBuilder<HomeTabViewModel, HomeTabState>(

                    builder:(context, state) {

                    if (state is DataLoadingState){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    if (state is DataLoadingFailState){
                      return Center(
                        child: Text(state.message ?? ''),
                      );
                    }
                      return Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView.separated(
                                itemBuilder: (context, index) {

                                  return CategoriesWidget(entity: viewModel.categoriesList, index: index);
                                },
                                separatorBuilder: (context, index) => SizedBox(width: 14,),
                                itemCount: viewModel.categoriesList.length),
                          )
                        ],
                      );

                  } ,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  HomeTabViewModel initViewModel() {
    return getIt<HomeTabViewModel>();
  }

}
