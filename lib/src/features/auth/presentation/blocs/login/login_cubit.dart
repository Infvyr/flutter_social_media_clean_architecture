import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../exceptions/auth_credentials.dart';
import '../../../../../shared/domain/index.dart';
import '../../../domain/entities/index.dart';
import '../../../domain/usecases/index.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LoginUser loginUser})
      : _loginUser = loginUser,
        super(const LoginState());

  final LoginUser _loginUser;

  void onUsernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([state.password, username]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  Future<void> loginWithCredentials() async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _loginUser(
          LoginUserParams(
            username: state.username,
            password: state.password,
          ),
        );
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          isValid: false,
        ));
      } on AuthCredentialsException catch (error) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: error.message,
        ));
      } catch (error) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: error.toString(),
        ));
      }
    }
  }
}
