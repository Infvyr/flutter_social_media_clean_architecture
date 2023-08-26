part of 'manage_content_bloc.dart';

sealed class ManageContentState extends Equatable {
  const ManageContentState();

  @override
  List<Object> get props => [];
}

final class ManageContentLoadingState extends ManageContentState {
  const ManageContentLoadingState();
}

final class ManageContentLoadedState extends ManageContentState {
  final List<Post> posts;

  const ManageContentLoadedState({this.posts = const []});

  @override
  List<Object> get props => [posts];
}
