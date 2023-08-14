part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
  });

  final Username username;
  final Password password;
  final FormzStatus status;
  final String errorMessage;

  factory LoginState.initial() {
    return const LoginState(
      username: Username.pure(),
      password: Password.pure(),
      status: FormzStatus.pure,
      errorMessage: '',
    );
  }

  LoginState copyWith({
    Username? username,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [username, password, status, errorMessage];
}
