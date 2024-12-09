import 'package:ecommerce_elevate/core/assets/animation_assets.dart';
import 'package:ecommerce_elevate/features/address/address_contract.dart';
import 'package:ecommerce_elevate/features/address/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<AddressViewModel>(context);
    return viewModel.state.addressState is InitialAddressState
        ? Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Lottie.asset(
              AnimationsAssets.mapLoadingAnimation,
            ),
          )
        : viewModel.locationData == null
            ? Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Lottie.asset(
                        AnimationsAssets.mapErrorAnimation,
                      ),
                    ),
                    Text(viewModel.locationMessage.value)
                  ],
                ),
              )
            : SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: GoogleMap(
                scrollGesturesEnabled: false,
                mapType: MapType.terrain,
                mapToolbarEnabled: true,
                initialCameraPosition: viewModel.cameraPosition,
                onMapCreated: (controller) {
                  viewModel.mapController = controller;
                },
              ),
            );
  }
}
