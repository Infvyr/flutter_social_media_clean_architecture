sealed class AuthCredentialsException implements Exception {
  const AuthCredentialsException(this.message);

  final String message;
}

class InvalidUsername extends AuthCredentialsException {
  const InvalidUsername() : super('invalid-username');
}

class UserNotFoundException extends AuthCredentialsException {
  const UserNotFoundException() : super('user-not-found');
}

class InvalidPassword extends AuthCredentialsException {
  const InvalidPassword() : super('invalid-password');
}

class InvalidEmail extends AuthCredentialsException {
  const InvalidEmail() : super('invalid-email');
}

class EmailAlreadyInUse extends AuthCredentialsException {
  const EmailAlreadyInUse() : super('email-already-in-use');
}

class WeakPassword extends AuthCredentialsException {
  const WeakPassword() : super('weak-password');
}

class WrongPassword extends AuthCredentialsException {
  const WrongPassword() : super('wrong-password');
}

String describeException(AuthCredentialsException exception) {
  return switch (exception) {
    InvalidUsername() => 'Invalid username. Please try again!',
    UserNotFoundException() => 'User not found. Please sign up first!',
    InvalidPassword() => 'Invalid password. Please try again!',
    InvalidEmail() => 'Invalid email. Please try again!',
    EmailAlreadyInUse() => 'Email already in use.',
    WeakPassword() => 'Weak password. The password must be 8 characters long or more.',
    WrongPassword() => 'Wrong password. Please try again!',
  };
}
