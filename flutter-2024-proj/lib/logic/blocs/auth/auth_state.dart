part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  List<Object> get props => [];
}

final class AuthInitial extends AuthState{}

final class AuthenticatedState extends AuthState {
  final User user;

  const AuthenticatedState({required this.user});
}

final class UnauthenticatedState extends AuthState {
  final String errorMsg;

  const UnauthenticatedState(this.errorMsg);
}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess({required this.user});
}

final class AuthFailure extends AuthState {
  final String errorMsg;

  AuthFailure(this.errorMsg);
}
