import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_view_model.dart';
import 'package:flutter/material.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key});

  @override
  State<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState
    extends BaseState<OccasionsScreen, OccasionsViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(LoadTabsAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.locale!.occasions),
      ),
    );
  }

  @override
  OccasionsViewModel initViewModel() {
    return getIt.get<OccasionsViewModel>();
  }
}
