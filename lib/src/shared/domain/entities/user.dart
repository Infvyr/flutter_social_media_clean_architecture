import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    this.followers = 0,
    this.followings = 0,
    this.avatarUrl,
  });

  final String id;
  final Username name;
  final int followers;
  final int followings;
  final String? avatarUrl;

  static const empty = User(id: 'user_0', name: Username.pure());

  @override
  List<Object?> get props => [id, name, followers, followings, avatarUrl];
}

enum UsernameValidationError { invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  /// username should be at least 2 characters long and can only contain letters, numbers, underscores
  /// username could contains two words separated by a space but not start or end with a space
  static final _usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{2,}(?: [a-zA-Z0-9_]+)*$');

  @override
  UsernameValidationError? validator(String value) {
    return _usernameRegExp.hasMatch(value) ? null : UsernameValidationError.invalid;
  }
}
