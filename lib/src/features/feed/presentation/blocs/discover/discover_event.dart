part of 'discover_bloc.dart';

sealed class DiscoverEvent extends Equatable {
  const DiscoverEvent();

  @override
  List<Object> get props => [];
}

final class GetDiscoverUsersEvent extends DiscoverEvent {
  const GetDiscoverUsersEvent();
}
