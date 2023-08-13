import '../../../../shared/domain/index.dart';

class LoggedInUser extends User {
  const LoggedInUser({
    required super.id,
    required super.name,
    super.followers,
    super.following,
    super.avatarUrl,
    this.email,
  });

  final String? email;

  static const empty = LoggedInUser(
    id: 'user_0',
    name: '',
    email: '-',
  );

  @override
  List<Object?> get props => [
        id,
        name,
        followers,
        following,
        avatarUrl,
        email,
      ];

  LoggedInUser copyWith({
    String? id,
    String? name,
    int? followers,
    int? following,
    String? avatarUrl,
    String? email,
  }) {
    return LoggedInUser(
      id: id ?? this.id,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
    );
  }
}
