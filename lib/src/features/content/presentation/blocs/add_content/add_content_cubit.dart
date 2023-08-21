import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_content_state.dart';

class AddContentCubit extends Cubit<AddContentState> {
  // TODO: Add a usecase to create a new content and save it.
  AddContentCubit() : super(AddContentState.initial());

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
    emit(
      state.copyWith(
        status: AddContentStatus.success,
      ),
    );
  }

  void reset() => emit(AddContentState.initial());
}
