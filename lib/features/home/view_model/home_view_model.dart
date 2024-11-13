import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_actions.dart';
import 'package:ecommerce_elevate/features/home/view_model/home_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeStates, HomeActions> {
  HomeViewModel() : super(InitHomeState());

  @override
  void doIntent(HomeActions action) {
    switch (action) {}
  }
}
