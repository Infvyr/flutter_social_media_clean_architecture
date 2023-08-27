part of 'manage_content_bloc.dart';

sealed class ManageContentEvent extends Equatable {
  const ManageContentEvent();

  @override
  List<Object> get props => [];
}

final class ManageContentGetPostsByUserEvent extends ManageContentEvent {
  const ManageContentGetPostsByUserEvent({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

final class ManageContentDeletePostEvent extends ManageContentEvent {
  const ManageContentDeletePostEvent({required this.post});

  final Post post;

  @override
  List<Object> get props => [post];
}
