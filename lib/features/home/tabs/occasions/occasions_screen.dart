import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_view_model.dart';
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
      child: DefaultTabController(
        length: viewModel.occasionsLength,
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
                    tabController = TabController(
                      length: viewModel.occasionsLength,
                      vsync: this,
                    );
                    return OccasionsTabbarWidget(
                      tabController: tabController,
                      tabs: state.occasions!.map((occasion) {
                        return Tab(text: occasion.name ?? "");
                      }).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
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
