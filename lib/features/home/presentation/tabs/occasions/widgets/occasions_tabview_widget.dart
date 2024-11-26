import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/occasions/occasions_view_model/occasions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccasionsTabviewWidget extends StatelessWidget {
  final OccasionsViewModel viewModel;
  const OccasionsTabviewWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccasionsViewModel, OccasionsStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailureState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is OccasionProductsSuccessState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: state.products?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                product: state.products![index],
                buttonTitle: viewModel.locale!.addToCart,
                buttonIcon: Icons.shopping_cart_outlined,
                onPressed: () {},
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
