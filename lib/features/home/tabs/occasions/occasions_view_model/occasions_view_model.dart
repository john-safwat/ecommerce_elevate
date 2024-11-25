import 'package:ecommerce_elevate/core/base/base_view_model.dart';
import 'package:ecommerce_elevate/core/datasource_execution/results.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasion.dart';
import 'package:ecommerce_elevate/features/home/domain/use_case/get_occasions_list_use_case.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_actions.dart';
import 'package:ecommerce_elevate/features/home/tabs/occasions/occasions_view_model/occasions_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionsViewModel
    extends BaseViewModel<OccasionsStates, OccasionsActions> {
  final GetOccasionsListUseCase _occasionsUseCase;

  int _occasionsLength = 0;
  int get occasionsLength => _occasionsLength;

  @factoryMethod
  OccasionsViewModel(this._occasionsUseCase) : super(OccasionInitialsState());

  @override
  Future<void> doIntent(OccasionsActions action) async {
    switch (action) {
      case LoadTabsAction():
        return _getOccasionTabs();

      case LoadProductsAction():
        throw UnimplementedError();
    }
  }

  Future<void> _getOccasionTabs() async {
    emit(OccasionLoadingState());

    final Results<List<Occasion>?> occasions = await _occasionsUseCase();

    switch (occasions) {
      case Success<List<Occasion>?>():
        _occasionsLength = occasions.data?.length ?? 0;
        emit(OccasionTabsSuccessState(occasions.data));

      case Failure<List<Occasion>?>():
        emit(
          OccasionFailureState(
            mapExceptionToMessage(occasions.exception),
            occasions.exception,
          ),
        );
    }
  }
}
