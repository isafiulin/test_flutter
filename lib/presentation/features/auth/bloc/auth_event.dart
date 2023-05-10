part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthConfirmPressed extends AuthEvent {
  const AuthConfirmPressed({required this.login, required this.password});

  final String login;
  final String password;

  @override
  List<Object> get props => [];
}
