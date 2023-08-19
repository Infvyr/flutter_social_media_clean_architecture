import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/index.dart';
import '../../../data/data_sources/index.dart';
import '../../../domain/entities/index.dart';
import '../../../domain/usecases/index.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUser _logoutUser;
  final GetAuthStatus _getAuthStatus;
  final GetLoggedInUser _getLoggedInUser;

  late StreamSubscription<AuthStatus> _authStatusSubscription;

  AuthBloc({
    required LogoutUser logoutUser,
    required GetAuthStatus getAuthStatus,
    required GetLoggedInUser getLoggedInUser,
  })  : _logoutUser = logoutUser,
        _getAuthStatus = getAuthStatus,
        _getLoggedInUser = getLoggedInUser,
        super(const AuthState.unknown()) {
    on<AuthGetStatusEvent>(_onAuthGetStatus);
    on<AuthLogoutUserEvent>(_onAuthLogoutUser);

    _authStatusSubscription = _getAuthStatus(const GetPostsByUserParams()).listen(
      (status) => add(AuthGetStatusEvent(status)),
    );
  }

  Future<void> _onAuthGetStatus(
    AuthGetStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    debugPrint('AuthGetStatus: ${event.status}');

    return switch (event.status) {
      AuthStatus.unauthenticated => emit(const AuthState.unauthenticated()),
      AuthStatus.authenticated => {
          debugPrint('AuthStatus.authenticated ${await _getLoggedInUser(const GetPostsByUserParams())}'),
          emit(
            AuthState.authenticated(
              await _getLoggedInUser(const GetPostsByUserParams()),
            ),
          )
        },
      AuthStatus.unknown => emit(const AuthState.unknown())
    };
  }

  Future<void> _onAuthLogoutUser(
    AuthLogoutUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    debugPrint('AuthLogoutUser _onAuthLogoutUser...');

    await _logoutUser(const GetPostsByUserParams());
    emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }
}
