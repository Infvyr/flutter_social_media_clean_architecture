import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/index.dart';
import '../../../domain/usecases/index.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final GetPosts _getPosts;

  FeedBloc({required GetPosts getPosts})
      : _getPosts = getPosts,
        super(const FeedLoadingState()) {
    on<GetFeedPostsEvent>(_onFeedGetPosts);
  }

  Future<void> _onFeedGetPosts(
    GetFeedPostsEvent event,
    Emitter<FeedState> emit,
  ) async {
    emit(const FeedLoadingState());
    debugPrint('Getting posts from feed...');
    final posts = await _getPosts(const NoParams());
    emit(FeedLoadedState(posts: posts));
  }
}
