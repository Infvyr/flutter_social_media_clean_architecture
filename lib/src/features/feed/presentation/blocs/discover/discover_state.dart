part of 'discover_bloc.dart';

sealed class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

final class DiscoverLoadingState extends DiscoverState {
  const DiscoverLoadingState();
}

final class DiscoverLoadedState extends DiscoverState {
  const DiscoverLoadedState({this.users = const []});

  final List<User> users;

  @override
  List<Object> get props => [users];
}
