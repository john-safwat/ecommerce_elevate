import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {
  final int paymentMethod;
  final String paymentMethodName;

  const PaymentMethodWidget(
      {required this.paymentMethod,
      required this.paymentMethodName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
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
              child: Text(
            paymentMethodName,
            style: Theme.of(context).textTheme.titleMedium,
          )),
          Radio(
            activeColor: AppColors.pink,
            value: paymentMethod,
            groupValue: 0,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
