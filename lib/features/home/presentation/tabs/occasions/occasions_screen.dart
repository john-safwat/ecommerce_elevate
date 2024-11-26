import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/occasions_app_bar_title.dart';
import 'widgets/occasions_tabbar_widget.dart';
import 'widgets/occasions_tabview_widget.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key});

  @override
  State<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState
    extends BaseState<OccasionsScreen, OccasionsViewModel>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<Occasion>? occasions;

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    tabController.removeListener(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    occasions = ModalRoute.of(context)?.settings.arguments as List<Occasion>?;

    if (occasions != null) {
      tabController = TabController(
        length: occasions!.length,
        vsync: this,
      );

      tabController.addListener(() {
        if (tabController.indexIsChanging) return;
        viewModel.doIntent(
          LoadProductsAction(occasions![tabController.index].id),
        );
      });

      viewModel.doIntent(LoadProductsAction(occasions![0].id));
    }
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
        body: DefaultTabController(
          length: occasions!.length,
          child: Column(
            children: [
              OccasionsTabbarWidget(
                tabController: tabController,
                tabs: occasions!.map((occasion) {
                  return Tab(text: occasion.name ?? "");
                }).toList(),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TabBarView(
                    controller: tabController,
                    children: occasions!
                        .map(
                          (occasion) =>
                              OccasionsTabviewWidget(viewModel: viewModel),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  OccasionsViewModel initViewModel() {
    return getIt.get<OccasionsViewModel>();
  }
}
