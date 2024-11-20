part of 'auth_bloc_bloc.dart';

class AuthState {
  AuthStatus status;
  AuthState({required this.status});

  AuthState copyWith({AuthStatus? newStatus}) {
    return AuthState(status: newStatus ?? status);
  }
}
