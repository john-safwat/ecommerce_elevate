import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/core/constants/routes.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_state.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_view_model.dart';
import 'package:ecommerce_elevate/features/saved_address/widget/saved_addresses_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SavedAddressesView extends StatefulWidget {
  final String title;
  final ProfileTabViewModel viewModel;

  const SavedAddressesView(
      {required this.viewModel, required this.title, super.key});

  @override
  State<SavedAddressesView> createState() => _SavedAddressesViewState();
}

class _SavedAddressesViewState extends State<SavedAddressesView> {
  @override
  Widget build(BuildContext context) {
    var addresses = (widget.viewModel.state.userProfileState as ProfileSuccessState)
        .user
        .addresses;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:BlocBuilder(
        bloc: widget.viewModel,
        builder: (context, state) {
          if (state is ProfileLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }

        if (addresses!.isEmpty ){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AnimationsAssets.loginImageAnimation),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, Routes.addressesRoute);
              }, child: Text('add address'))
            ],
          );
        }
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            children: [
              ListView.separated(
                shrinkWrap: true,

                  itemBuilder: (context, index) {
                    return SavedAddressesCardWidget(
                      profileViewModel: widget.viewModel,
                      index: index,
                    );

                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemCount: addresses!.length),
              const SizedBox(height: 48,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, Routes.addressesRoute);
                      setState(() {

                      });
                    }, child: Text('add address')),
                  ),
                ],
              )
            ],
          ),
        );
      },)
    );
  }
}
