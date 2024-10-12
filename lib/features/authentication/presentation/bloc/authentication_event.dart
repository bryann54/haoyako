// authentication_event.dart
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationSignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class AuthenticationSignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignUpEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class AuthenticationLogoutEvent extends AuthenticationEvent {}
