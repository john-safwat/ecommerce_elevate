import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_contract.dart';
import 'package:ecommerce_elevate/features/home/product_details/presentation/product_details_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'should call _changeCurrentPageIndex() when ChangeCurrentPageIndexAction',
      () {
    ProductDetailsViewModel viewModel = ProductDetailsViewModel();

    viewModel.doIntent(ChangeCurrentPageIndexAction(1));

    expect(viewModel.currentPageIndex, 1);
  });
}
