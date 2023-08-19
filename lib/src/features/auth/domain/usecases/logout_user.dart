import '../../../../shared/domain/index.dart';
import '../repositories/index.dart';

class LogoutUser implements UseCase<void, GetPostsByUserParams> {
  LogoutUser(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<void> call(GetPostsByUserParams params) {
    return authRepository.logout();
  }
}
