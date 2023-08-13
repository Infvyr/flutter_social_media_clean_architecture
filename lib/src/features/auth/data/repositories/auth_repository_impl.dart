import '../../../../shared/domain/entities/user.dart';
import '../../index.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.mockAuthDataSources);

  final MockAuthDataSources mockAuthDataSources;

  @override
  Stream<AuthStatus> get status => mockAuthDataSources.status;

  @override
  Future<LoggedInUser> get loggedInUser => mockAuthDataSources.loggedInUser;

  @override
  Future<void> login({required Username username, required Password password}) {
    return mockAuthDataSources.login(username: username, password: password);
  }

  @override
  Future<void> signup({required LoggedInUser user}) {
    return mockAuthDataSources.signup(user: user);
  }

  @override
  Future<void> logout() {
    return mockAuthDataSources.logout();
  }
}
