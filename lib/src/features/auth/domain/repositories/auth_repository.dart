import '../../../../shared/domain/index.dart';
import '../../data/data_sources/index.dart';
import '../entities/index.dart';

abstract class AuthRepository {
  Stream<AuthStatus> get status;
  Future<LoggedInUser> get loggedInUser;
  Future<void> signup({required LoggedInUser user});
  Future<void> login({required Username username, required Password password});
  Future<void> logout();
}
