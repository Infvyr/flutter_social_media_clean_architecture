import '../../../../shared/domain/index.dart';
import '../repositories/index.dart';

class LogoutUser implements UseCase<void, NoParams> {
  LogoutUser(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<void> call(NoParams params) {
    return authRepository.logout();
  }
}
