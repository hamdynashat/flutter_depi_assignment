part of 'auth_cubit.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {
  const AuthLoading();
}
final class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated(this.user);
}
final class AuthUnAuthenticated extends AuthState {
  final String? message;
  const AuthUnAuthenticated([this.message]);
}
