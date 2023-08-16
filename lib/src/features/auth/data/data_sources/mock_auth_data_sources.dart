import 'dart:async' show Future, Stream, StreamController;

import '../../../../exceptions/auth_credentials.dart';
import '../../../../shared/domain/index.dart';
import '../../domain/entities/index.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

abstract class MockAuthDataSources {
  Stream<AuthStatus> get status;
  Future<LoggedInUser> get loggedInUser;
  Future<void> signup({required LoggedInUser user});
  Future<void> login({required Username username, required Password password});
  Future<void> logout();
}

class MockAuthDataSourcesImpl extends MockAuthDataSources {
  MockAuthDataSourcesImpl({CacheClient? cacheClient}) : _cacheClient = cacheClient ?? CacheClient();

  final CacheClient _cacheClient;
  final _streamController = StreamController<AuthStatus>();

  static const userCacheKey = '__user_cache_key__';

  @override
  Stream<AuthStatus> get status async* {
    await Future.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _streamController.stream;
  }

  @override
  Future<LoggedInUser> get loggedInUser {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return _cacheClient.read(key: userCacheKey) ?? LoggedInUser.empty;
    });
  }

  @override
  Future<void> signup({required LoggedInUser user}) {
    return Future.delayed(const Duration(milliseconds: 300), () {
      _allUsers.add(user);

      _updateLoggedInUser(
        id: user.id,
        name: user.name,
        email: user.email,
      );

      _streamController.add(AuthStatus.unauthenticated);
    });
  }

  @override
  Future<void> login({required Username username, required Password password}) {
    return Future.delayed(const Duration(milliseconds: 300), () {
      for (final user in _allUsers) {
        if (user.name.value == username.value) {
          _updateLoggedInUser(id: user.id, name: user.name);
          _streamController.add(AuthStatus.authenticated);
          return;
        }
      }
      throw describeException(const UserNotFoundException());
    });
  }

  @override
  Future<void> logout() {
    return Future.delayed(const Duration(milliseconds: 300), () {
      _cacheClient.write(key: userCacheKey, value: LoggedInUser.empty);
      _streamController.add(AuthStatus.unauthenticated);
    });
  }

  void _updateLoggedInUser({
    String? id,
    Username? name,
    Email? email,
  }) {
    LoggedInUser user = _cacheClient.read(key: userCacheKey) ?? LoggedInUser.empty;
    _cacheClient.write(
      key: userCacheKey,
      value: user.copyWith(
        id: id,
        name: name,
        email: email,
      ),
    );
  }
}

final List<User> _allUsers = [
  const User(
    id: 'user_1',
    name: Username.dirty('Alexander'),
    avatarUrl: 'assets/images/user_1.jpg',
  ),
  const User(
    id: 'user_2',
    name: Username.dirty('Mark'),
    avatarUrl: 'assets/images/user_2.jpg',
  ),
  const User(
    id: 'user_3',
    name: Username.dirty('Mary'),
    avatarUrl: 'assets/images/user_3.jpg',
  ),
];

class CacheClient {
  CacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  void write<T extends Object>({
    required String key,
    required T value,
  }) {
    _cache[key] = value;
  }

  T? read<T extends Object>({required String key}) {
    return _cache[key] as T?;
  }
}
