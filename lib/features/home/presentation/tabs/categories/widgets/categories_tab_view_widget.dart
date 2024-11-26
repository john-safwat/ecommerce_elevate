import 'package:ecommerce_elevate/core/shared_widgets/product_card_widget.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/view_model/categories_states.dart';
import 'package:ecommerce_elevate/features/home/presentation/tabs/categories/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTabviewWidget extends StatelessWidget {
  final CategoriesViewModel viewModel;
  const CategoriesTabviewWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesViewModel, CategoriesStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsFailureState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ProductsSuccessState) {
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
