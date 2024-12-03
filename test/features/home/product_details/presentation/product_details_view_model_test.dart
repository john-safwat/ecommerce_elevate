// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/features/product_details/presentation/product_details_contract.dart';
import 'package:ecommerce_elevate/features/product_details/presentation/product_details_view_model.dart';

void main() {
  test(
      'should call _changeCurrentPageIndex() when ChangeCurrentPageIndexAction',
      () {
    ProductDetailsViewModel viewModel = ProductDetailsViewModel();

    viewModel.doIntent(ChangeCurrentPageIndexAction(1));

    expect(viewModel.currentPageIndex, 1);
  });
}
