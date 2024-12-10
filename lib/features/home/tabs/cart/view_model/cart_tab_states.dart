sealed class CartTabState {
  dynamic get data => null;
}

class CartTabInitialState extends CartTabState {}

class CartTabLoadingState extends CartTabState {}

class NavigateToLoginScreen extends CartTabState {}

class CartTabLoadingSuccessState<T> extends CartTabState {
  final T? _data;

  CartTabLoadingSuccessState(this._data);

  @override
  T? get data => _data;
}

class CartTabLoadingFailState extends CartTabState {
  String errorMessage;

  Exception exception;

  CartTabLoadingFailState(this.errorMessage, this.exception);
}

class CartTabStates {
  late CartTabState userCartState;
  late CartTabState navigationState;

  CartTabStates() {
    userCartState = CartTabInitialState();
    navigationState = CartTabInitialState();
  }

  CartTabStates copyWith({
    CartTabState? userCartState,
    CartTabState? navigationState,
  }) {
    return CartTabStates()
      ..userCartState = userCartState ?? this.userCartState
      ..navigationState = navigationState ?? this.navigationState;
  }
}
