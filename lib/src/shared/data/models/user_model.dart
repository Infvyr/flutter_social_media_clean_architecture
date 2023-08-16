import '../../domain/index.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    this.followers = 0,
    this.followings = 0,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final int followers;
  final int followings;
  final String? avatarUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      followers: json['followers'] as int,
      followings: json['followings'] as int,
      avatarUrl: json['avatarUrl'] as String?,
    );
  }

  factory UserModel.fromEntity(User entity) {
    return UserModel(
      id: entity.id,
      name: entity.name.value,
      followers: entity.followers,
      followings: entity.followings,
      avatarUrl: entity.avatarUrl,
    );
  }

  User toEntity() {
    return User(
      id: id,
      name: Username.dirty(name),
      followers: followers,
      followings: followings,
      avatarUrl: avatarUrl,
    );
  }
}
