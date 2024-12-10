import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/domain/entities/addresses/response/address.dart';
import 'package:ecommerce_elevate/features/checkout/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressWidget extends StatelessWidget {
  final Address address;
  final Function onPress;
  const AddressWidget({required this.address , required this.onPress , super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<CheckoutViewModel>(context);
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () {
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withOpacity(0.5),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: address,
                        activeColor: AppColors.pink,
                        groupValue: viewModel.address,
                        onChanged: (value) {},
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(
                            address.street ?? "No Name",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                          child: Text(
                            address.city ?? "No Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge,
                          ))
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // todo to be implement
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
