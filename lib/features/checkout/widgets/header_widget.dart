import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/checkout/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<CheckoutViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                viewModel.locale!.deliveryTime,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Text(
                viewModel.locale!.scheduled,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.access_time_sharp,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              const SizedBox(width: 8),
              Text(
                viewModel.locale!.instant,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: Text(
                  " , ${viewModel.locale!.arriveBy} ${DateFormat('d MMM y, hh:mm a').format(DateTime.now())}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.green),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
