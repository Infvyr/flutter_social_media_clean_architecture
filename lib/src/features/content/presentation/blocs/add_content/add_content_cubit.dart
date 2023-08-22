import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../shared/domain/index.dart';
import '../../../domain/usecases/create_post.dart';

part 'add_content_state.dart';

class AddContentCubit extends Cubit<AddContentState> {
  final CreatePost _createPost;
  AddContentCubit({required CreatePost createPost})
      : _createPost = createPost,
        super(AddContentState.initial());

  void videoChanged(File video) {
    emit(
      state.copyWith(
        video: video,
        status: AddContentStatus.submitting,
      ),
    );
  }

  void captionChanged(String caption) {
    emit(
      state.copyWith(
        caption: caption,
        status: AddContentStatus.submitting,
      ),
    );
  }

  void submit() {
    emit(state.copyWith(status: AddContentStatus.submitting));
    try {
      final post = Post(
        id: const Uuid().v4(),
        user: User.empty,
        caption: state.caption,
        assetPath: state.video!.path,
      );
      _createPost(CreatePostParams(post: post));
      emit(state.copyWith(status: AddContentStatus.success));
    } catch (_) {
      emit(state.copyWith(status: AddContentStatus.error));
    }
  }

  void reset() => emit(AddContentState.initial());
}
