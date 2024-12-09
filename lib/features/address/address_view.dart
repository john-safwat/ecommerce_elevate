import 'package:country_state_city/models/city.dart';
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/address/address_contract.dart';
import 'package:ecommerce_elevate/features/address/address_view_model.dart';
import 'package:ecommerce_elevate/features/address/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends BaseState<AddressView, AddressViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.doIntent(InitAddressAction());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.locale!.address),
        ),
        body: BlocConsumer<AddressViewModel, AddressesStates>(
          listener: (context, state) {
            if (state.navigationState is ShowLoadingState) {
              AppDialogs.showLoading(
                  message: viewModel.locale!.loading, context: context);
            }
            if (state.navigationState is HideLoadingState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Form(
              key: viewModel.formKey,
              onChanged: () => viewModel.doIntent(UpdateFormAction()),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // ignore: prefer_const_constructors
                  MapWidget(),
                  const SizedBox(height: 24),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.addressValidation(value ?? ""),
                    keyboardType: TextInputType.streetAddress,
                    controller: viewModel.addressController,
                    decoration: InputDecoration(
                      label: Text(viewModel.locale!.address),
                      hintText: viewModel.locale!.address,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        viewModel.phoneValidation(value ?? ""),
                    keyboardType: TextInputType.phone,
                    controller: viewModel.phoneController,
                    decoration: InputDecoration(
                      label: Text(viewModel.locale!.phone),
                      hintText: viewModel.locale!.phone,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => viewModel.nameValidation(value ?? ""),
                    keyboardType: TextInputType.name,
                    controller: viewModel.nameController,
                    decoration: InputDecoration(
                      label: Text(viewModel.locale!.userName),
                      hintText: viewModel.locale!.userName,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).secondaryHeaderColor),
                        borderRadius: BorderRadius.circular(4)),
                    child: DropdownButton<City>(
                      value: viewModel.selectedCity,
                      hint: Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(viewModel.locale!.city),
                        ],
                      ),
                      isExpanded: true,
                      underline: const SizedBox(),
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      items: viewModel.cities
                          .map<DropdownMenuItem<City>>(
                            (e) => DropdownMenuItem<City>(
                              value: e,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(e.name),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (City? value) {
                        viewModel.doIntent(ChangeSelectedCity(value!));
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  ValueListenableBuilder(
                    valueListenable: viewModel.valid,
                    builder: (context, value, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: value
                              ? Theme.of(context).primaryColor
                              : AppColors.black[AppColors.colorCode30],
                          padding: const EdgeInsets.all(16)),
                      onPressed: () {
                        viewModel.doIntent(SaveAddressAction());
                      },
                      child: Text(viewModel.locale!.saveAddress),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  AddressViewModel initViewModel() {
    return getIt<AddressViewModel>();
  }
}
