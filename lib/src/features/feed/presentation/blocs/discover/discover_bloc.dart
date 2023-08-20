import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/index.dart';
import '../../../domain/usecases/index.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetUsers _getDiscoverUsers;

  DiscoverBloc({required GetUsers getDiscoverUsers})
      : _getDiscoverUsers = getDiscoverUsers,
        super(const DiscoverLoadingState()) {
    on<GetDiscoverUsersEvent>(_onDiscoverGetUsers);
  }

  Future<void> _onDiscoverGetUsers(
    GetDiscoverUsersEvent event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(const DiscoverLoadingState());
    final users = await _getDiscoverUsers(const NoParams());
    emit(DiscoverLoadedState(users: users));
  }
}
