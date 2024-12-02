
sealed class LogoutStates {}

class LogoutInitialState extends LogoutStates {}
class LogoutLoadingState extends LogoutStates {}
class LogoutFailState extends LogoutStates {
  final String message;
  Exception exception;

  LogoutFailState(this.message, this.exception);

}
class LogoutSuccessState extends LogoutStates {
}


