import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/cart_tab.dart';
import 'package:ecommerce_elevate/features/home/tabs/categories/categories_tab.dart';
import 'package:ecommerce_elevate/features/home/tabs/home/home_tab_view.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/profile_tab.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_actions.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeStates, HomeActions> {
  HomeViewModel() : super(InitHomeState());

  int currentIndex = 0;

  List<Widget> tabs = [const HomeTabView() , const CategoriesTab() , const CartTab() , const ProfileTab()];

  @override
  void doIntent(HomeActions action) {
    switch (action) {
      case ChangeSelectedIndex():{
        _changeSelectedIndex(action.selectedIndex);
      }
    }
  }

  void _changeSelectedIndex(int selectedIndex) {
    currentIndex = selectedIndex;
    emit(TabChangedState());
  }
}
