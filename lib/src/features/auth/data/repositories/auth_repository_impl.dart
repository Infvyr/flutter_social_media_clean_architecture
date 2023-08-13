import '../../../../shared/domain/entities/user.dart';
import '../../domain/entities/logged_in_user.dart';
import '../../domain/repositories/index.dart';
import '../data_sources/index.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.mockAuthDataSources);

  final MockAuthDataSources mockAuthDataSources;

  @override
  Stream<AuthStatus> get status => mockAuthDataSources.status;

  @override
  Future<LoggedInUser> get loggedInUser => mockAuthDataSources.loggedInUser;

  @override
  Future<void> login({
    required Username username,
    required Password password,
  }) {
    return mockAuthDataSources.login(
      username: username,
      password: password,
    );
  }

  @override
  Future<void> logout() => mockAuthDataSources.logout();

  @override
  Future<void> signup({required LoggedInUser user}) {
    return mockAuthDataSources.signup(user: user);
  }
}
