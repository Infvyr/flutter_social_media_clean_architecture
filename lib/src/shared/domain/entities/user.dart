import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    this.followers = 0,
    this.following = 0,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final int followers;
  final int following;
  final String? avatarUrl;

  static const empty = User(id: 'user_0', name: '');

  @override
  List<Object?> get props => [id, name, followers, following, avatarUrl];
}
