part of 'feed_bloc.dart';

sealed class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

final class FeedLoadingState extends FeedState {
  const FeedLoadingState();
}

final class FeedLoadedState extends FeedState {
  const FeedLoadedState({this.posts = const <Post>[]});

  final List<Post> posts;

  @override
  List<Object> get props => [posts];
}
