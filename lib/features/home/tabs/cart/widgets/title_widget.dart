// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/home/tabs/cart/view_model/cart_tab_view_model.dart';

// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {
  CartTabViewModel viewModel;

  TitleWidget(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        Row(
          children: [
            Text(
              viewModel.locale!.cart,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              " (${viewModel.state.userCartState.data?.numOfCartItems ?? 0} ${viewModel.locale!.items})",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.gray,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Location
        ValueListenableBuilder(
          valueListenable: viewModel.locationMessage,
          builder: (context, value, child) => Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.black[AppColors.colorCode40],
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
