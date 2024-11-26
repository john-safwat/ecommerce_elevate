sealed class HomeTabState {
  dynamic get data => null;
}

class HomeInitialState extends HomeTabState {}

class HomeTabLoadingState extends HomeTabState {}

class HomeTabLoadingSuccessState<T> extends HomeTabState {
  final T? _data;

  HomeTabLoadingSuccessState(this._data);

  @override
  T? get data => _data;
}

class HomeTabLoadingFailState extends HomeTabState {
  String errorMessage;

  Exception exception;

  HomeTabLoadingFailState(this.errorMessage, this.exception);
}

class HomeTabStates {
  late HomeTabState categoriesState;
  late HomeTabState occasionsState;
  late HomeTabState productsState;

  HomeTabStates() {
    categoriesState = HomeInitialState();
    occasionsState = HomeInitialState();
    productsState = HomeInitialState();
  }

  // Method to create a copy of HomeTabStates
  HomeTabStates copyWith({
    HomeTabState? categoriesState,
    HomeTabState? occasionsState,
    HomeTabState? productsState,
  }) {
    return HomeTabStates()
      ..categoriesState = categoriesState ?? this.categoriesState
      ..occasionsState = occasionsState ?? this.occasionsState
      ..productsState = productsState ?? this.productsState;
  }
}
