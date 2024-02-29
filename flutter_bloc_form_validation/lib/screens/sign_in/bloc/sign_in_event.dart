part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

// 2 events : Change Text field and button press

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmittedEvent(this.email, this.password);
}
