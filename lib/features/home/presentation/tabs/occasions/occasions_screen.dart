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
  @override
  void dispose() {
    super.dispose();
    viewModel.tabController.dispose();
    viewModel.tabController.removeListener(() {});
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if(viewModel.occasions!.isEmpty){
      viewModel.occasions =
      ModalRoute.of(context)?.settings.arguments as List<Occasion>?;
      viewModel.tabController = TabController(
        length: viewModel.occasions!.length,
        vsync: this,
      );
      viewModel.tabController.addListener(() {
        if (viewModel.tabController.indexIsChanging) return;
        viewModel.doIntent(
          LoadProductsAction(
              viewModel.occasions![viewModel.tabController.index].id),
        );
      });
      viewModel.doIntent(
        LoadProductsAction(
            viewModel.occasions![viewModel.tabController.index].id),
      );
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
          length: viewModel.occasions!.length,
          child: Column(
            children: [
              OccasionsTabbarWidget(
                tabController: viewModel.tabController,
                tabs: viewModel.occasions!.map((occasion) {
                  return Tab(text: occasion.name ?? "");
                }).toList(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: OccasionsTabviewWidget(viewModel: viewModel),
                ),
              ),
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
