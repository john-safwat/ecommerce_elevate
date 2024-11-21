

sealed class HomeTabState {}

class DataLoadingInitialState extends HomeTabState {}
class DataLoadingSuccessState extends HomeTabState {}
class DataLoadingFailState extends HomeTabState {
  String? message ;

  DataLoadingFailState(this.message);
}
class DataLoadingState extends HomeTabState {}