// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/index.dart';
import '../../../../feed/domain/usecases/index.dart';

part 'manage_content_event.dart';
part 'manage_content_state.dart';

class ManageContentBloc extends Bloc<ManageContentEvent, ManageContentState> {
  ManageContentBloc({required GetPostsByUser getPostsByUser})
      : _getPostsByUser = getPostsByUser,
        super(const ManageContentLoadingState()) {
    on<ManageContentGetPostsByUserEvent>(_loadPostsByUser);
  }

  final GetPostsByUser _getPostsByUser;

  void _loadPostsByUser(
    ManageContentGetPostsByUserEvent event,
    Emitter<ManageContentState> emit,
  ) async {
    final posts = await _getPostsByUser(
      GetPostsByUserParams(userId: event.userId),
    );
    emit(ManageContentLoadedState(posts: posts));
  }
}
