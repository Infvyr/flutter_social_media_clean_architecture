part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthGetStatusEvent extends AuthEvent {
  const AuthGetStatusEvent(this.status);

  final AuthStatus status;

  @override
  List<Object> get props => [status];
}

final class AuthLogoutUserEvent extends AuthEvent {}
