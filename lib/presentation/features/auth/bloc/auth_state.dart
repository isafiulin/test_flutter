part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthConfirmState extends AuthState {}


class AuthConfirmedState extends AuthState {}

class AuthConfirmedErrorState extends AuthState {}


