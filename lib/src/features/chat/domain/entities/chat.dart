import 'package:equatable/equatable.dart';

import '../../../../shared/domain/index.dart';
import 'message.dart';

class Chat extends Equatable {
  const Chat({
    required this.id,
    required this.currentUser,
    required this.otherUser,
    this.messages,
  });

  final String id;
  final User currentUser;
  final User otherUser;
  final List<Message>? messages;

  @override
  List<Object?> get props => [id, currentUser, otherUser, messages];

  Chat copyWith({
    String? id,
    User? currentUser,
    User? otherUser,
    List<Message>? messages,
  }) {
    return Chat(
      id: id ?? this.id,
      currentUser: currentUser ?? this.currentUser,
      otherUser: otherUser ?? this.otherUser,
      messages: messages ?? this.messages,
    );
  }
}
