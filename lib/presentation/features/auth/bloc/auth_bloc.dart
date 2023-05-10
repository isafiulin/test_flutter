import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthConfirmPressed>(_loadProductEdit);
  }

//add checking for authenticated
  Future<void> _loadProductEdit(
    AuthConfirmPressed event,
    Emitter<AuthState> emit,
  ) async {
    const String mokLogin = "test";
    const String mokPassword = "test";

    if (event.login == mokLogin && event.password == mokPassword) {
      emit(AuthConfirmedState());
    } else {
      emit(AuthConfirmedErrorState());
    }
  }
}
