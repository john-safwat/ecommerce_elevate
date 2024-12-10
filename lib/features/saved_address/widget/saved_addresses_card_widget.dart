
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/utils/app_dialogs.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_contract.dart';
import 'package:ecommerce_elevate/features/saved_address/view_model/remove_address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SavedAddressesCardWidget extends StatelessWidget {
  late RemoveAddressViewModel viewModel;
  final Address address;
  final int index;
  SavedAddressesCardWidget({required this.address , required this.index ,super.key});

  @override
  Widget build(BuildContext context) {
    viewModel = BlocProvider.of<RemoveAddressViewModel>(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
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
                      address.city ?? "",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _showDeleteConfirmation(context, address.id),
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
                Text(address.street ?? ""),
              ],
            ),
          ],
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
}



