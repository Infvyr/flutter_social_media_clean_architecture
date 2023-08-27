import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/index.dart';
import '../../../../feed/domain/usecases/index.dart';
import '../../../domain/usecases/index.dart';

part 'manage_content_event.dart';
part 'manage_content_state.dart';

class ManageContentBloc extends Bloc<ManageContentEvent, ManageContentState> {
  ManageContentBloc({
    required GetPostsByUser getPostsByUser,
    required DeletePost deletePost,
  })  : _getPostsByUser = getPostsByUser,
        _deletePost = deletePost,
        super(const ManageContentLoadingState()) {
    on<ManageContentGetPostsByUserEvent>(_onLoadPostsByUser);
    on<ManageContentDeletePostEvent>(_onDeletePost);
  }

  final GetPostsByUser _getPostsByUser;
  final DeletePost _deletePost;

  void _onLoadPostsByUser(
    ManageContentGetPostsByUserEvent event,
    Emitter<ManageContentState> emit,
  ) async {
    final posts = await _getPostsByUser(
      GetPostsByUserParams(userId: event.userId),
    );
    emit(ManageContentLoadedState(posts: posts));
  }

  void _onDeletePost(
    ManageContentDeletePostEvent event,
    Emitter<ManageContentState> emit,
  ) async {
    if (state is ManageContentLoadedState) {
      final state = this.state as ManageContentLoadedState;
      await _deletePost(DeletePostParams(postId: event.post.id));
      // remove post from state
      List<Post> posts = List.from(state.posts)..remove(event.post);
      emit(ManageContentLoadedState(posts: posts));
    }
  }
}
