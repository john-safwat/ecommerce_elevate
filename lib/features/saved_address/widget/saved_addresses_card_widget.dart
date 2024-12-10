import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/base/base_view.dart';
import 'package:ecommerce_elevate/core/di/di.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/features/home/tabs/profile/view_model/profile_tab_view_model.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_contract.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/tabs/profile/view_model/profile_tab_state.dart';

class SavedAddressesCardWidget extends StatefulWidget {
  final ProfileTabViewModel profileViewModel;
  final int index;

  const SavedAddressesCardWidget({
    required this.index,
    required this.profileViewModel,
    super.key,
  });

  @override
  State<SavedAddressesCardWidget> createState() =>
      _SavedAddressesCardWidgetState();
}

class _SavedAddressesCardWidgetState
    extends BaseState<SavedAddressesCardWidget, RemoveAddressViewModel> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final addresses = (widget.profileViewModel.state.userProfileState
    as ProfileSuccessState)
        .user
        .addresses;

    final address = addresses?[widget.index];

    return BlocListener<RemoveAddressViewModel, RemoveAddressState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is SuccessRemoveAddressState) {
          AppDialogs.showSuccessDialog(
            message: 'Address removed successfully.',
            context: context,
            posActionTitle: 'OK',
            posAction: () {
              addresses;
              widget.profileViewModel.getLoggedUser(); // Trigger a refresh
            },
          );
        } else if (state is ErrorRemoveAddressState) {
          AppDialogs.showFailDialog(
            message: 'Failed to remove address.',
            context: context,
          );
        }

      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 24,
                      ),
                      Text(
                        address?.city ?? "",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => _showDeleteConfirmation(context, address?.id),
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          size: 24,
                          color: AppColors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement edit functionality here
                        },
                        icon: const Icon(
                          Icons.edit_outlined,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(address?.street ?? ""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String? addressId) {
    if (addressId == null) return;

    AppDialogs.showInfoDialog(
      message: 'Are you sure you want to remove this address?',
      context: context,
      posAction: () {
        viewModel.doIntent(SaveRemovedAddressAction(addressId));
      },
      posActionTitle: 'Yes',
      negativeActionTitle: 'No',
    );
  }

  @override
  RemoveAddressViewModel initViewModel() {
    return getIt<RemoveAddressViewModel>();
  }
}

