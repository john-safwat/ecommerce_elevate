// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/cart_tab_view.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/categories_tab.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/home_tab_view.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/profile_tab.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_actions.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_states.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeStates, HomeActions> {
  HomeViewModel() : super(InitHomeState());

  int currentIndex = 0;

  List<Widget> tabs = [
    const HomeTabView(),
    const CategoriesTab(),
    const CartTabView(),
    const ProfileTab()
  ];

  @override
  Future<void> doIntent(HomeActions action) async {
    switch (action) {
      case ChangeSelectedIndex():
        {
          _changeSelectedIndex(action.selectedIndex);
        }
    }
  }

  void _changeSelectedIndex(int selectedIndex) {
    currentIndex = selectedIndex;
    emit(TabChangedState());
  }
}
