part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthenticationInitiasFetchEvent extends AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String name;

  SignUpEvent(
      {required this.email, required this.password, required this.name});
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}
