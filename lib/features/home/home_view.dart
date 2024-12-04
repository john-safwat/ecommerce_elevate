// 🐦 Flutter imports:

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_actions.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_states.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView, HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeViewModel, HomeStates>(
        builder: (context, state) => Scaffold(
          body: viewModel.tabs[viewModel.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: (value) => viewModel.doIntent(ChangeSelectedIndex(value)),
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined),
                    label: viewModel.locale!.home),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.category_outlined),
                    label: viewModel.locale!.categories),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: viewModel.locale!.cart),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outline),
                    label: viewModel.locale!.profile),
              ]),
        ),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return getIt<HomeViewModel>();
  }
}
