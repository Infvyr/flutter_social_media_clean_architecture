import 'package:formz/formz.dart';

import '../../../../shared/domain/index.dart';

class LoggedInUser extends User {
  const LoggedInUser({
    required super.id,
    required super.name,
    super.followers,
    super.followings,
    super.avatarUrl,
    this.email,
  });

  final Email? email;

  static const empty = LoggedInUser(
    id: 'user_0',
    name: Username.pure(),
    email: Email.pure(),
  );

  @override
  List<Object?> get props => [
        id,
        name,
        followers,
        followings,
        avatarUrl,
        email,
      ];

  LoggedInUser copyWith({
    String? id,
    Username? name,
    int? followers,
    int? followings,
    String? avatarUrl,
    Email? email,
  }) {
    return LoggedInUser(
      id: id ?? this.id,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
    );
  }
}

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegExp.hasMatch(value) ? null : PasswordValidationError.invalid;
  }
}
