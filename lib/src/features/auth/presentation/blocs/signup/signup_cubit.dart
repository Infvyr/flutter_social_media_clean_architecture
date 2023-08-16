import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../exceptions/auth_credentials.dart';
import '../../../../../shared/domain/index.dart';
import '../../../domain/entities/index.dart';
import '../../../domain/usecases/index.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required SignupUser signupUser})
      : _signupUser = signupUser,
        super(const SignupState());

  final SignupUser _signupUser;

  void onUsernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.email, state.password]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.username, state.password]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  Future<void> signupWithCredentials() async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _signupUser(
          SignupUserParams(
            user: LoggedInUser(
              id: 'user_000',
              name: state.username,
              email: state.email,
            ),
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
          isValid: false,
        ));
      } catch (error) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: error.toString(),
          isValid: false,
        ));
      } finally {
        emit(state.copyWith(
          status: FormzSubmissionStatus.initial,
          isValid: false,
          username: const Username.pure(),
          email: const Email.pure(),
          password: const Password.pure(),
        ));
      }
    }
  }
}
