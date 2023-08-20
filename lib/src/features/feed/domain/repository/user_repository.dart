import '../../../../shared/domain/index.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<User> getUser(String userId);
}
