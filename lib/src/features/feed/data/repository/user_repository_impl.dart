import '../../../../shared/domain/entities/user.dart';
import '../../domain/repository/index.dart';
import '../data_sources/index.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this.mockFeedDataSource);

  final MockFeedDataSource mockFeedDataSource;

  @override
  Future<User> getUser(String userId) => mockFeedDataSource.getUser(userId);

  @override
  Future<List<User>> getUsers() => mockFeedDataSource.getUsers();
}
