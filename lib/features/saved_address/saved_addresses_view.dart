import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_contract.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_view_model.dart';
import 'package:ecommerce_elevate/features/saved_address/widget/saved_addresses_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SavedAddressesView extends StatefulWidget {
  final String title;

  const SavedAddressesView({required this.title, super.key});

  @override
  State<SavedAddressesView> createState() => _SavedAddressesViewState();
}

class _SavedAddressesViewState
    extends BaseState<SavedAddressesView, RemoveAddressViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(InitViewModel());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider.value(
        value: viewModel,
        child: BlocConsumer<RemoveAddressViewModel, RemoveAddressState>(
          listener: (context, state)async {
            if(state is NavigateToAddAddressScreen){
              await Navigator.pushNamed(context, Routes.addressesRoute);
              viewModel.doIntent(InitViewModel());
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: Lottie.asset(AnimationsAssets.loginImageAnimation),
              );
            } else if (state is ErrorAddressState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AnimationsAssets.loginImageAnimation),
                  Text(
                    viewModel.locale!.dioUnknownMessage,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.doIntent(InitViewModel());
                    },
                    child: Text(viewModel.locale!.tryAgain),
                  )
                ],
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemBuilder: (context, index) => SavedAddressesCardWidget(
                        index: index, address: viewModel.address[index],),
                    itemCount:  viewModel.address.length,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: (){
                          viewModel.doIntent(AddAddressAction());
                        },
                        child: Text(viewModel.locale!.addAddress)
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  RemoveAddressViewModel initViewModel() {
    return getIt<RemoveAddressViewModel>();
  }
}
