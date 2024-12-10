// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/domain/entities/cart/cart_data/user_cart_response.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/view_model/cart_tab_view_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BillingInformation extends StatelessWidget {
  UserCartResponse? userCartResponse;
  CartTabViewModel viewModel;

  BillingInformation(this.userCartResponse, this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              viewModel.locale!.subTotal,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.gray),
            ),
            const Spacer(),
            Text(
              "${userCartResponse?.cart?.totalPrice ?? 0} \$",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.gray),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              viewModel.locale!.deliveryFee,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.gray),
            ),
            const Spacer(),
            Text(
              "10 \$",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.gray),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              viewModel.locale!.total,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Text(
              "${(userCartResponse?.cart?.totalPrice ?? 0) + (userCartResponse?.cart?.totalPrice == null ? 0 : 10)} \$",
              style: Theme.of(context).textTheme.titleLarge!,
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(viewModel.locale!.checkout),
            ))
      ],
    );
  }
}
