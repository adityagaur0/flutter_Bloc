part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

// in total there will be three states: error State, Invalid State(not able to click on sign in button), Valid State(no error , and able to click on button)

class SignInErrorState extends SignInState {
  // there we need to change the error data dynamically that is why we need error message
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}


class SignInValidState extends SignInState {}


// to show the progress indicator
class SignInLoadingState extends SignInState{}