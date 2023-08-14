import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../exceptions/auth_credentials.dart';
import '../../../../../shared/domain/index.dart';
import '../../../domain/entities/index.dart';
import '../../../domain/usecases/index.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser _loginUser;
  LoginCubit({required LoginUser loginUser})
      : _loginUser = loginUser,
        super(LoginState.initial());

  void changeUsername(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([username, state.password]),
    ));
  }

  void changePassword(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.username, password]),
    ));
  }

  Future<void> loginWithCredentials() async {
    if (state.status.isInvalid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _loginUser(LoginUserParams(
        username: state.username,
        password: state.password,
      ));
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on AuthCredentialsException catch (error) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: error.message,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: error.toString(),
      ));
    }
  }
}
